<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => 'user', 
            'is_active' => true,
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;
        return response()->json(['message' => 'Registrasi berhasil', 'token' => $token, 'user' => $user], 201);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Email atau Password salah'], 401);
        }

        // --- KUNCI LOGIC BLOKIR USER ---
        if (!$user->is_active) {
            return response()->json(['message' => 'Akun Anda sedang dinonaktifkan oleh Admin. Silakan hubungi pusat bantuan.'], 403);
        }

        $token = $user->createToken('auth_token')->plainTextToken;
        return response()->json(['message' => 'Login berhasil', 'token' => $token, 'user' => $user], 200);
    }

    // --- RESET PASSWORD ---
    public function resetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'new_password' => 'required|min:6',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['message' => 'Alamat email tidak terdaftar di sistem kami.'], 404);
        }

        $user->password = Hash::make($request->new_password);
        $user->save();

        return response()->json(['message' => 'Password berhasil direset! Silakan login menggunakan password baru.'], 200);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Logout berhasil'], 200);
    }
}