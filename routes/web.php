<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;

Route::get('/', function () {
    return view('welcome');
});

// --- RUTE PENYELAMAT BUG SYMLINK WINDOWS ---
// Rute untuk melayani gambar tiket secara manual untuk mengatasi kelemahan php artisan serve di Windows
Route::get('/storage/tickets/{filename}', function ($filename) {
    // Ambil path lokasi asli file disimpan
    $path = storage_path('app/public/tickets/' . $filename);
    
    // Jika file tidak ada, kembalikan error 404
    if (!File::exists($path)) {
        abort(404);
    }

    // Baca file dan tipe mimenya (jpg/png)
    $file = File::get($path);
    $type = File::mimeType($path);

    // Buat response file untuk dikirim ke Flutter
    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);

    return $response;
});