<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ticket;
use App\Models\TicketHistory;
use App\Models\TicketComment;
use App\Models\User;
use App\Models\Notification;
use App\Models\ActivityLog;
use Illuminate\Support\Facades\Auth;

class TicketController extends Controller
{
    private function authorizeAccess($ticket, $user)
    {
        if ($user->role === 'admin') return true;
        if ($user->role === 'user' && $ticket->user_id === $user->id) return true;
        if ($user->role === 'helpdesk' && ($ticket->helpdesk_id === $user->id || $ticket->user_id === $user->id)) return true;
        return false;
    }

    public function index(Request $request)
    {
        $user = $request->user();
        if ($user->role === 'admin') {
            $tickets = Ticket::where('hidden_by_admin', false)->with(['user', 'helpdesk'])->orderBy('created_at', 'desc')->get();
        } elseif ($user->role === 'helpdesk') {
            $tickets = Ticket::where('helpdesk_id', $user->id)->where('hidden_by_helpdesk', false)->with(['user', 'helpdesk'])->orderBy('created_at', 'desc')->get();
        } else {
            $tickets = Ticket::where('user_id', $user->id)->where('hidden_by_user', false)->with(['user', 'helpdesk'])->orderBy('created_at', 'desc')->get();
        }
        return response()->json(['data' => $tickets], 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'image' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048'
        ]);

        $filePath = null;
        if ($request->hasFile('image')) {
            $filePath = $request->file('image')->store('tickets', 'public');
        }

        $ticket = new Ticket();
        $ticket->user_id = Auth::id(); 
        $ticket->title = $request->title;
        $ticket->description = $request->description;
        $ticket->file_path = $filePath;
        $ticket->status = 'open';
        $ticket->save();

        $history = new TicketHistory();
        $history->ticket_id = $ticket->id;
        $history->user_id = Auth::id();
        $history->action = 'Created Ticket';
        $history->description = 'Tiket baru dibuat dengan status Open';
        $history->save();

        $creatorName = Auth::user()->name;

        ActivityLog::create([
            'user_id' => Auth::id(), 
            'action' => 'Membuat Tiket', 
            'description' => 'Anda membuat tiket keluhan: ' . $ticket->title
        ]);

        $admins = User::where('role', 'admin')->get();
        foreach ($admins as $admin) {
            if ($admin->id !== Auth::id()) {
                ActivityLog::create([
                    'user_id' => $admin->id, 
                    'action' => 'Tiket Masuk', 
                    'description' => "Tiket keluhan baru dibuat oleh $creatorName: " . $ticket->title
                ]);
                Notification::create([
                    'user_id' => $admin->id, 
                    'ticket_id' => $ticket->id, 
                    'title' => 'Tiket Baru!', 
                    'message' => "Ada tiket masuk dari $creatorName yang butuh penanganan."
                ]);
            }
        }

        return response()->json(['message' => 'Tiket berhasil dibuat', 'data' => $ticket], 201);
    }

    public function show(Request $request, $id)
    {
        $ticket = Ticket::with(['user', 'helpdesk'])->find($id);
        if (!$ticket) return response()->json(['message' => 'Tiket tidak ditemukan'], 404);

        if (!$this->authorizeAccess($ticket, $request->user())) {
            return response()->json(['message' => 'Akses Ditolak. Ini adalah tiket internal.'], 403);
        }

        $histories = TicketHistory::where('ticket_id', $id)->orderBy('created_at', 'desc')->get();
        $comments = TicketComment::where('ticket_id', $id)->orderBy('created_at', 'asc')->get();
        
        $commentsArray = [];
        foreach ($comments as $comment) {
            $c = $comment->toArray();
            $c['user'] = User::find($comment->user_id);
            $c['message'] = $comment->comment; 
            $commentsArray[] = $c;
        }

        $ticketArray = $ticket->toArray();
        $ticketArray['histories'] = $histories;
        $ticketArray['comments'] = $commentsArray;

        return response()->json(['ticket' => $ticketArray], 200);
    }

    public function updateStatus(Request $request, $id)
    {
        $request->validate(['status' => 'required|in:open,assign,in_progress,closed']);
        $ticket = Ticket::find($id);
        if (!$ticket) return response()->json(['message' => 'Tiket tidak ditemukan'], 404);

        $user = $request->user();
        if ($user->role === 'user') {
            return response()->json(['message' => 'User tidak diizinkan mengubah status.'], 403);
        }
        if ($user->role === 'helpdesk' && $ticket->helpdesk_id !== $user->id) {
            return response()->json(['message' => 'Anda tidak berhak mengubah tiket ini.'], 403);
        }

        $ticket->status = $request->status;
        $ticket->save();

        $history = new TicketHistory();
        $history->ticket_id = $ticket->id;
        $history->user_id = Auth::id();
        $history->action = 'Status Updated';
        $history->description = 'Status tiket diubah menjadi ' . $request->status;
        $history->save();

        $executorName = $user->name;

        // 1. LOG UNTUK EKSEKUTOR (Orang yang mengubah status)
        ActivityLog::create([
            'user_id' => Auth::id(), 
            'action' => 'Update Status', 
            'description' => "Anda mengubah status tiket '{$ticket->title}' menjadi " . strtoupper($request->status)
        ]);

        // 2. NOTIF & LOG UNTUK PEMILIK TIKET (User tetap dapat notifikasi jika status diubah)
        if ($ticket->user_id !== Auth::id()) {
            ActivityLog::create([
                'user_id' => $ticket->user_id, 
                'action' => 'Status Berubah', 
                'description' => "Status tiket '{$ticket->title}' Anda telah diubah menjadi " . strtoupper($request->status)
            ]);
            Notification::create([
                'user_id' => $ticket->user_id, 
                'ticket_id' => $ticket->id, 
                'title' => 'Update Status Tiket', 
                'message' => "Tiket Anda sekarang berstatus: " . strtoupper($request->status)
            ]);
        }

        // 3. NOTIF UNTUK ADMIN JIKA HELPDESK YANG MENGUBAH STATUS
        if ($user->role === 'helpdesk') {
            $admins = User::where('role', 'admin')->get();
            foreach ($admins as $admin) {
                ActivityLog::create([
                    'user_id' => $admin->id, 
                    'action' => 'Status Berubah', 
                    'description' => "Helpdesk ($executorName) mengubah status tiket '{$ticket->title}' menjadi " . strtoupper($request->status)
                ]);
                Notification::create([
                    'user_id' => $admin->id, 
                    'ticket_id' => $ticket->id, 
                    'title' => 'Helpdesk Mengupdate Tiket', 
                    'message' => "Helpdesk ($executorName) telah mengubah status tiket '{$ticket->title}' menjadi " . strtoupper($request->status)
                ]);
            }
        }

        // 4. NOTIF UNTUK HELPDESK JIKA ADMIN YANG MENGUBAH STATUS
        if ($user->role === 'admin' && $ticket->helpdesk_id !== null) {
            ActivityLog::create([
                'user_id' => $ticket->helpdesk_id, 
                'action' => 'Status Berubah', 
                'description' => "Admin ($executorName) mengintervensi dan mengubah status tiket '{$ticket->title}' yang Anda tangani menjadi " . strtoupper($request->status)
            ]);
            Notification::create([
                'user_id' => $ticket->helpdesk_id, 
                'ticket_id' => $ticket->id, 
                'title' => 'Admin Mengupdate Tiket Anda', 
                'message' => "Admin ($executorName) mengubah status tiket '{$ticket->title}' yang sedang Anda tangani menjadi " . strtoupper($request->status)
            ]);
        }

        return response()->json(['message' => 'Status berhasil diubah', 'data' => $ticket], 200);
    }

    public function assignTicket(Request $request, $id)
    {
        if ($request->user()->role !== 'admin') {
            return response()->json(['message' => 'Hanya admin yang dapat menugaskan tiket.'], 403);
        }

        $request->validate(['helpdesk_id' => 'required|exists:users,id']);
        $ticket = Ticket::find($id);
        if (!$ticket) return response()->json(['message' => 'Tiket tidak ditemukan'], 404);

        $ticket->helpdesk_id = $request->helpdesk_id;
        $ticket->status = 'assign';
        $ticket->save();

        $history = new TicketHistory();
        $history->ticket_id = $ticket->id;
        $history->user_id = Auth::id();
        $history->action = 'Ticket Assigned';
        $history->description = 'Tiket ditugaskan ke helpdesk';
        $history->save();

        $helpdesk = User::find($request->helpdesk_id);

        ActivityLog::create([
            'user_id' => Auth::id(), 
            'action' => 'Assign Tiket', 
            'description' => "Anda menugaskan tiket '{$ticket->title}' kepada {$helpdesk->name}"
        ]);

        ActivityLog::create([
            'user_id' => $helpdesk->id, 
            'action' => 'Tugas Baru', 
            'description' => "Anda ditugaskan oleh Admin untuk tiket: " . $ticket->title
        ]);
        Notification::create([
            'user_id' => $helpdesk->id, 
            'ticket_id' => $ticket->id, 
            'title' => 'Tugas Baru!', 
            'message' => "Anda ditugaskan menangani tiket: {$ticket->title}."
        ]);

        if ($ticket->user_id !== Auth::id()) {
            ActivityLog::create([
                'user_id' => $ticket->user_id, 
                'action' => 'Tiket Diproses', 
                'description' => "Tiket '{$ticket->title}' Anda ditugaskan kepada {$helpdesk->name}"
            ]);
            Notification::create([
                'user_id' => $ticket->user_id, 
                'ticket_id' => $ticket->id, 
                'title' => 'Tiket Anda Mulai Diproses', 
                'message' => "Tiket Anda telah ditugaskan dan akan ditangani oleh {$helpdesk->name}."
            ]);
        }

        return response()->json(['message' => 'Tiket berhasil di-assign', 'data' => $ticket], 200);
    }

    public function destroy(Request $request, $id)
    {
        $user = $request->user();
        $ticket = Ticket::find($id);
        if (!$ticket) return response()->json(['message' => 'Tiket tidak ditemukan'], 404);

        if (!$this->authorizeAccess($ticket, $user)) {
            return response()->json(['message' => 'Akses Ditolak.'], 403);
        }

        if ($user->role === 'admin') $ticket->hidden_by_admin = true;
        elseif ($user->role === 'helpdesk') $ticket->hidden_by_helpdesk = true;
        else $ticket->hidden_by_user = true;
        
        $shouldHardDelete = false;
        if ($ticket->status === 'open') {
            if ($ticket->hidden_by_user && $ticket->hidden_by_admin) {
                $shouldHardDelete = true;
            }
        } else {
            if ($ticket->hidden_by_user && $ticket->hidden_by_admin && $ticket->hidden_by_helpdesk) {
                $shouldHardDelete = true;
            }
        }

        if ($shouldHardDelete) {
            TicketComment::where('ticket_id', $ticket->id)->delete();
            TicketHistory::where('ticket_id', $ticket->id)->delete();
            Notification::where('ticket_id', $ticket->id)->delete(); 
            $ticket->delete();
            return response()->json(['message' => 'Tiket dihapus permanen dari sistem karena semua pihak telah menghapusnya'], 200);
        } else {
            $ticket->save();
            return response()->json(['message' => 'Tiket berhasil dihapus dari daftar Anda'], 200);
        }
    }

    public function destroyAll(Request $request)
    {
        $user = $request->user();
        
        if ($user->role === 'admin') {
            $tickets = Ticket::where('hidden_by_admin', false)->get();
        } elseif ($user->role === 'helpdesk') {
            $tickets = Ticket::where('helpdesk_id', $user->id)->where('hidden_by_helpdesk', false)->get();
        } else {
            $tickets = Ticket::where('user_id', $user->id)->where('hidden_by_user', false)->get();
        }

        foreach ($tickets as $ticket) {
            if ($user->role === 'admin') $ticket->hidden_by_admin = true;
            elseif ($user->role === 'helpdesk') $ticket->hidden_by_helpdesk = true;
            else $ticket->hidden_by_user = true;

            $shouldHardDelete = false;
            if ($ticket->status === 'open') {
                if ($ticket->hidden_by_user && $ticket->hidden_by_admin) $shouldHardDelete = true;
            } else {
                if ($ticket->hidden_by_user && $ticket->hidden_by_admin && $ticket->hidden_by_helpdesk) $shouldHardDelete = true;
            }

            if ($shouldHardDelete) {
                TicketComment::where('ticket_id', $ticket->id)->delete();
                TicketHistory::where('ticket_id', $ticket->id)->delete();
                Notification::where('ticket_id', $ticket->id)->delete();
                $ticket->delete();
            } else {
                $ticket->save();
            }
        }

        return response()->json(['message' => 'Semua tiket berhasil dibersihkan dari daftar Anda'], 200);
    }

    public function addComment(Request $request, $id)
    {
        $request->validate(['message' => 'required|string']);
        
        $ticket = Ticket::find($id);
        if (!$ticket) return response()->json(['message' => 'Tiket tidak ditemukan'], 404);

        if (!$this->authorizeAccess($ticket, $request->user())) {
            return response()->json(['message' => 'Akses Ditolak. Anda tidak dapat mengomentari tiket ini.'], 403);
        }

        $comment = new TicketComment();
        $comment->ticket_id = $ticket->id;
        $comment->user_id = Auth::id();
        $comment->comment = $request->message;
        $comment->save();

        $ticket->hidden_by_user = false;
        $ticket->hidden_by_helpdesk = false;
        $ticket->hidden_by_admin = false;
        $ticket->save();

        return response()->json(['message' => 'Komentar berhasil ditambahkan', 'data' => $comment], 201);
    }

    public function getHelpdesks()
    {
        $helpdesks = User::where('role', 'helpdesk')->get();
        return response()->json(['data' => $helpdesks], 200);
    }
}