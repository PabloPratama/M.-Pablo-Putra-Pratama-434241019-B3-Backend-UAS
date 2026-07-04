<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;

Route::get('/', function () {
    return view('welcome');
});

// --- RUTE PENYELAMAT BUG SYMLINK WINDOWS (DIPERBARUI) ---
//Uubah URL-nya dari '/storage/...' menjadi '/ticket-image/...'
// agar tidak dicegat oleh server Apache/PHP sebelum masuk ke Laravel.
Route::get('/ticket-image/{filename}', function ($filename) {
    $path = storage_path('app/public/tickets/' . $filename);
    
    if (!File::exists($path)) {
        abort(404);
    }

    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);

    return $response;
});