<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\DashboardController; 
use App\Http\Controllers\NotificationController; 
use App\Http\Controllers\ActivityLogController; 
use App\Http\Controllers\AdminController; 

// ROUTE AUTENTIKASI
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/reset-password', [AuthController::class, 'resetPassword']); 

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::get('/dashboard', [DashboardController::class, 'index']);

    // --- ROUTE ADMIN (KELOLA PENGGUNA) ---
    Route::get('/admin/users', [AdminController::class, 'getUsers']);
    Route::post('/admin/users/{id}/toggle', [AdminController::class, 'toggleUserStatus']);

    // TIKET ROUTES
    Route::get('/tickets', [TicketController::class, 'index']); 
    Route::post('/tickets', [TicketController::class, 'store']); 
    Route::delete('/tickets/all', [TicketController::class, 'destroyAll']); 
    Route::get('/tickets/{id}', [TicketController::class, 'show']); 
    Route::put('/tickets/{id}/status', [TicketController::class, 'updateStatus']); 
    Route::post('/tickets/{id}/assign', [TicketController::class, 'assignTicket']); 
    Route::delete('/tickets/{id}', [TicketController::class, 'destroy']); 
    Route::post('/tickets/{id}/comments', [TicketController::class, 'addComment']); 
    Route::get('/helpdesks', [TicketController::class, 'getHelpdesks']); 

    // RUTE NOTIFIKASI
    Route::get('/notifications', [NotificationController::class, 'index']);
    Route::delete('/notifications/all', [NotificationController::class, 'destroyAll']);
    Route::delete('/notifications/{id}', [NotificationController::class, 'destroy']);

    // RUTE HISTORY/ACTIVITY
    Route::get('/histories', [ActivityLogController::class, 'index']);
    Route::delete('/histories/all', [ActivityLogController::class, 'destroyAll']);
    Route::delete('/histories/{id}', [ActivityLogController::class, 'destroy']);
});