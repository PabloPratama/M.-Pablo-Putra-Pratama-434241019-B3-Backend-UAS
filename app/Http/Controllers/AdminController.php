<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class AdminController extends Controller
{
    // Mengambil daftar semua user dan helpdesk
    public function getUsers(Request $request)
    {
        // Pastikan hanya admin yang bisa mengakses ini
        if ($request->user()->role !== 'admin') {
            return response()->json(['message' => 'Akses ditolak.'], 403);
        }

        // Ambil semua selain admin
        $users = User::whereIn('role', ['user', 'helpdesk'])->orderBy('created_at', 'desc')->get();
        return response()->json(['data' => $users], 200);
    }

    // Mengaktifkan atau Menonaktifkan pengguna
    public function toggleUserStatus(Request $request, $id)
    {
        if ($request->user()->role !== 'admin') {
            return response()->json(['message' => 'Akses ditolak.'], 403);
        }

        $user = User::find($id);
        if (!$user) {
            return response()->json(['message' => 'Pengguna tidak ditemukan'], 404);
        }

        // Balikkan statusnya (jika true jadi false, jika false jadi true)
        $user->is_active = !$user->is_active;
        $user->save();

        $statusString = $user->is_active ? 'diaktifkan' : 'dinonaktifkan';

        return response()->json([
            'message' => "Pengguna {$user->name} berhasil $statusString",
            'data' => $user
        ], 200);
    }
}