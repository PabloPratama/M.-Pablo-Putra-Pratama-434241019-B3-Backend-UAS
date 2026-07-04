<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    public function index()
    {
        $notifications = Notification::where('user_id', Auth::id())->orderBy('created_at', 'desc')->get();
        return response()->json(['data' => $notifications], 200);
    }

    public function destroy($id)
    {
        Notification::where('id', $id)->where('user_id', Auth::id())->delete();
        return response()->json(['message' => 'Notifikasi dihapus permanen'], 200);
    }

    public function destroyAll()
    {
        Notification::where('user_id', Auth::id())->delete();
        return response()->json(['message' => 'Semua notifikasi dihapus permanen'], 200);
    }
}