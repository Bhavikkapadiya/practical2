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

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('lang/{locale}', 'HomeController@lang');

Route::resource('company', 'CompanyController');
Route::resource('employee', 'EmployeeController');
Route::resource('product', 'ProductController');
Route::post('/import_parse', 'ProductController@parseImport')->name('import_parse');
Route::post('/import_process', 'ProductController@processImport')->name('import_process');

