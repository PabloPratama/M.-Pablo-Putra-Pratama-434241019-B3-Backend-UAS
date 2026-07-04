<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Ticket extends Model
{
    protected $fillable = [
        'user_id', 
        'helpdesk_id', 
        'title', 
        'description', 
        'file_path', 
        'status',
        'hidden_by_user',       
        'hidden_by_helpdesk',   
        'hidden_by_admin'       
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function helpdesk(): BelongsTo
    {
        return $this->belongsTo(User::class, 'helpdesk_id');
    }

    public function histories(): HasMany
    {
        return $this->hasMany(TicketHistory::class);
    }

    public function comments(): HasMany
    {
        return $this->hasMany(TicketComment::class);
    }
}