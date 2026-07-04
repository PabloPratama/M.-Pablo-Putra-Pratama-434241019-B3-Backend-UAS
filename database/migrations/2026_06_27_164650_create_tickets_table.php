<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete(); // Pembuat tiket
            $table->foreignId('helpdesk_id')->nullable()->constrained('users')->nullOnDelete(); // Helpdesk yang ditugaskan
            $table->string('title');
            $table->text('description');
            $table->string('file_path')->nullable(); // Untuk upload gambar/file
            $table->enum('status', ['open', 'assign', 'in_progress', 'closed'])->default('open');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tickets');
    }
};