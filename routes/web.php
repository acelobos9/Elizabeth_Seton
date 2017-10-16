<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard/', 'DashboardController@index');
Route::get('/add-user', 'DashboardController@getadd');
Route::post('/add-user','DashboardController@postadd');

Route::get('/admission','AdmissionController@index');
Route::post('/admission','AdmissionController@postadd');

Route::post('/', function () {
    return view('welcome');
});
Route::put('/', function () {
    return view('welcome');
});
Route::patch('/', function () {
    return view('welcome');
});
Route::post('/', function () {
    return view('welcome');
});
Route::delete('/', function () {
    return view('welcome');
});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
