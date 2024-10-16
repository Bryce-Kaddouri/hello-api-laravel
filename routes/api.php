<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'api'], function () {
    Route::get('/hello', function(){
        return response()->json([
            'message' => 'Hello World',
            'status' => 200,
        ], 200);
    });
});
