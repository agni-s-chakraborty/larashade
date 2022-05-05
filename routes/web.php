<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\CustomAuthController;
use App\Http\Controllers\Admin\MemberController;
use App\Http\Controllers\Admin\Flights\CompanyController;
use App\Http\Controllers\Admin\Flights\DetailsController;
use App\Http\Controllers\Admin\Flights\DestinationsController;
use App\Http\Controllers\Admin\Flights\ScheduleController;
use App\Http\Controllers\Admin\Flights\PropertiesController;
use App\Http\Controllers\Admin\Flights\PriceController;
use App\Http\Controllers\Admin\Hotels\AboutController;
use App\Http\Controllers\Admin\Hotels\PropController;
use App\Http\Controllers\Admin\Hotels\HotelRoomsController;
use App\Http\Controllers\Admin\Hotels\RoomsPriceController;
use App\Http\Controllers\Admin\Hotels\RestaurantsController;
use App\Http\Controllers\Admin\Mg\MgregisterController;
use App\Http\Controllers\Admin\Cms\GeneralController;
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

//ROUTES FOR AUTHENTICATION
Route::view('/login', 'admin.auth.login')->middleware('alreadyLoggedIn');
Route::view('/register', 'admin.auth.register')->middleware('alreadyLoggedIn');
Route::view('/reset', 'admin.auth.reset');
Route::view('/verify', 'admin.auth.verify');

Route::get('/dashboard', [CustomAuthController::class, 'dashboard'])->middleware('isLoggedIn');
Route::get('/logout', [CustomAuthController::class, 'logout']);

Route::post('/register-user', [CustomAuthController::class, 'doRegister'])->name('register-user');
Route::post('/verify-email', [CustomAuthController::class, 'doVerify'])->name('verify-email');
Route::post('/reset-password', [CustomAuthController::class, 'doReset'])->name('reset-password');
Route::post('/login-user', [CustomAuthController::class, 'doLogin'])->name('login-user');

//ROUTES FOR MEMBERS
Route::get('/members', [MemberController::class, 'show']);
Route::post('/members-new', [MemberController::class, 'create']);
Route::get('/members-edit', [MemberController::class, 'edit']);
Route::post('/members-update', [MemberController::class, 'update']);
Route::get('/members-remove/{id}', [MemberController::class, 'remove']);
Route::get('/members-status', [MemberController::class, 'status']);


//ROUTES FOR FLIGHTS COMPANY

Route::get('/flight-company', [CompanyController::class, 'show']);
Route::post('/flight-company-new', [CompanyController::class, 'create'])->name('flight-company-new');
Route::get('/flight-company-edit', [CompanyController::class, 'edit']);
Route::post('/flight-company-update', [CompanyController::class, 'update']);
Route::get('/flight-company-remove/{id}', [CompanyController::class, 'remove']);
Route::get('/flight-company-status', [CompanyController::class, 'status']);

//ROUTES FOR FLIGHTS PROPERTIES

Route::get('/flight-properties', [PropertiesController::class, 'show']);
Route::post('/flight-properties-new', [PropertiesController::class, 'create'])->name('flight-properties-new');
Route::get('/flight-properties-edit', [PropertiesController::class, 'edit']);
Route::post('/flight-properties-update', [PropertiesController::class, 'update']);
Route::get('/flight-properties-remove/{id}', [PropertiesController::class, 'remove']);
Route::get('/flight-properties-status', [PropertiesController::class, 'status']);

//ROUTES FOR FLIGHTS DESTINATIONS

Route::get('/flight-destinations', [DestinationsController::class, 'show']);
Route::post('/flight-destinations-new', [DestinationsController::class, 'create'])->name('flight-destinations-new');
Route::get('/flight-destinations-edit', [DestinationsController::class, 'edit']);
Route::post('/search-byid_fldest', [DestinationsController::class, 'search_by_id']);
Route::post('/flight-destinations-update', [DestinationsController::class, 'update']);
Route::get('/flight-destinations-remove/{id}', [DestinationsController::class, 'remove']);
Route::get('/flight-destinations-status', [DestinationsController::class, 'status']);

//ROUTES FOR FLIGHTS SCHEDULE

Route::get('/flight-schedule', [ScheduleController::class, 'show']);
Route::post('/flight-schedule-new', [ScheduleController::class, 'create'])->name('flight-schedule-new');
Route::get('/flight-schedule-edit', [ScheduleController::class, 'edit']);
Route::post('/search-byid-flsched', [ScheduleController::class, 'search_by_id']);
Route::get('autocomplete', [ScheduleController::class, 'autocomplete'])->name('autocomplete');
Route::post('/flight-schedule-update', [ScheduleController::class, 'update']);
Route::get('/flight-schedule-remove/{id}', [ScheduleController::class, 'remove']);
Route::get('/flight-schedule-status', [ScheduleController::class, 'status']);


//ROUTES FOR FLIGHTS PRICES

Route::get('/flight-price', [PriceController::class, 'show']);
Route::post('/flight-price-new', [PriceController::class, 'create'])->name('flight-price-new');
Route::get('/flight-price-edit', [PriceController::class, 'edit']);
Route::post('/search-byid_flprice', [PriceController::class, 'search_by_id']);
Route::get('autocomplete', [PriceController::class, 'autocomplete'])->name('autocomplete');
Route::post('/flight-price-update', [PriceController::class, 'update']);
Route::get('/flight-price-remove/{id}', [PriceController::class, 'remove']);
Route::get('/flight-price-status', [PriceController::class, 'status']);





//ROUTES FOR HOTELS ABOUT

Route::get('/hotel-about', [AboutController::class, 'show']);
Route::post('/hotel-about-new', [AboutController::class, 'create'])->name('hotel-about-new');
Route::get('/hotel-about-edit', [AboutController::class, 'edit']);
Route::post('/search-byid_habout', [AboutController::class, 'search_by_id']);
Route::get('autocomplete', [AboutController::class, 'autocomplete'])->name('autocomplete');
Route::post('/hotel-about-update', [AboutController::class, 'update']);
Route::get('/hotel-about-remove/{id}', [AboutController::class, 'remove']);
Route::get('/hotel-about-status', [AboutController::class, 'status']);

//ROUTES FOR HOTELS PROPERTIES

Route::get('/hotel-properties', [PropController::class, 'show']);
Route::post('/hotel-properties-new', [PropController::class, 'create'])->name('hotel-properties-new');
Route::get('/hotel-properties-edit', [PropController::class, 'edit']);
Route::post('/search-byid-hprop', [PropController::class, 'search_by_id']);
Route::post('/hotel-properties-update', [PropController::class, 'update']);
Route::get('/hotel-properties-remove/{id}', [PropController::class, 'remove']);
Route::get('/hotel-properties-status', [PropController::class, 'status']);

//ROUTES FOR HOTELS ROOMS

Route::get('/hotel-rooms', [HotelRoomsController::class, 'show']);
Route::post('/hotel-rooms-new', [HotelRoomsController::class, 'create'])->name('hotel-rooms-new');
Route::get('/hotel-rooms-edit', [HotelRoomsController::class, 'edit']);
Route::post('/search-byid-hrooms', [HotelRoomsController::class, 'search_by_id']);
Route::post('/hotel-rooms-update', [HotelRoomsController::class, 'update']);
Route::get('/hotel-rooms-remove/{id}', [HotelRoomsController::class, 'remove']);
Route::get('/hotel-rooms-status', [HotelRoomsController::class, 'status']);

//ROUTES FOR HOTELS ROOMS PRICE

Route::get('/rooms-price', [RoomsPriceController::class, 'show']);
Route::post('/rooms-price-new', [RoomsPriceController::class, 'create'])->name('rooms-price-new');
Route::get('/rooms-price-edit', [RoomsPriceController::class, 'edit']);
Route::post('/search-byid-rprice', [RoomsPriceController::class, 'search_by_id']);
Route::post('/rooms-price-update', [RoomsPriceController::class, 'update']);
Route::get('/rooms-price-remove/{id}', [RoomsPriceController::class, 'remove']);
Route::get('/rooms-price-status', [RoomsPriceController::class, 'status']);

//ROUTES FOR RESTAURANTS

Route::get('/rest-hotel', [RestaurantsController::class, 'show']);
Route::post('/rest-hotel-new', [RestaurantsController::class, 'create'])->name('rest-hotel-new');
Route::get('/rest-hotel-edit', [RestaurantsController::class, 'edit']);
Route::post('/search-byid-rhotel', [RestaurantsController::class, 'search_by_id']);
Route::post('/rest-hotel-update', [RestaurantsController::class, 'update']);
Route::get('/rest-hotel-remove/{id}', [RestaurantsController::class, 'remove']);
Route::get('/rest-hotel-status', [RestaurantsController::class, 'status']);


//ROUTES FOR MGREGISTER

Route::get('/mgregister', [MgregisterController::class, 'show']);
Route::post('/mgregister-new', [MgregisterController::class, 'create'])->name('mgregister-new');
Route::get('/mgregister-edit', [MgregisterController::class, 'edit']);
Route::post('/mgregister-update', [MgregisterController::class, 'update']);
Route::get('/mgregister-remove/{id}', [MgregisterController::class, 'remove']);
Route::get('/mgregister-status', [MgregisterController::class, 'status']);


//ROUTES FOR GeneralController

Route::get('/cms', [GeneralController::class, 'show']);
Route::post('/cms-new', [GeneralController::class, 'create'])->name('cms-new');
Route::post('/section-new', [GeneralController::class, 'createSection'])->name('section-new');
Route::get('/cms-remove/{id}', [GeneralController::class, 'remove']);
Route::get('/section-remove/{id}', [GeneralController::class, 'removeSection']);

//ROUTES FOR G