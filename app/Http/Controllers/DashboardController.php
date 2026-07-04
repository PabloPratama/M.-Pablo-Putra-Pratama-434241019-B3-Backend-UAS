<?php

namespace App\Http\Controllers;

use App\Models\Ticket;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        
        $query = Ticket::query();
        $openQuery = Ticket::query()->where('status', 'open');

        // Logika menyembunyikan tiket dari perhitungan statistik
        if ($user->role === 'admin') {
            $query->where('hidden_by_admin', false);
            $openQuery->where('hidden_by_admin', false);
        } elseif ($user->role === 'helpdesk') {
            $query->where('helpdesk_id', $user->id)->where('hidden_by_helpdesk', false);
            $openQuery->where('hidden_by_helpdesk', false); // Helpdesk melihat semua Open yg tidak dia hapus
        } else {
            $query->where('user_id', $user->id)->where('hidden_by_user', false);
            $openQuery->where('user_id', $user->id)->where('hidden_by_user', false);
        }
        
        $statistics = [
            'total_tickets' => (clone $query)->count(),
            'open_tickets' => $openQuery->count(),
            'assign_tickets' => (clone $query)->where('status', 'assign')->count(),
            'in_progress_tickets' => (clone $query)->where('status', 'in_progress')->count(),
            'closed_tickets' => (clone $query)->where('status', 'closed')->count(),
        ];

        return response()->json(['data' => $statistics]);
    }
}