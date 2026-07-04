<?php

namespace App\Http\Controllers;

use App\Models\ActivityLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ActivityLogController extends Controller
{
    public function index()
    {
        $logs = ActivityLog::where('user_id', Auth::id())->orderBy('created_at', 'desc')->get();
        return response()->json(['data' => $logs], 200);
    }

    public function destroy($id)
    {
        ActivityLog::where('id', $id)->where('user_id', Auth::id())->delete();
        return response()->json(['message' => 'History dihapus permanen'], 200);
    }

    public function destroyAll()
    {
        ActivityLog::where('user_id', Auth::id())->delete();
        return response()->json(['message' => 'Semua history dihapus permanen'], 200);
    }
}