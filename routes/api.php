<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AppController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/auth/register', [AuthController::class, 'register']);
Route::get('/redirect',[AuthController::class, 'nouser'])->name('nouser');
Route::post('/auth/login', [AuthController::class, 'login'])->name('login');
Route::post('/forgot-password', [AuthController::class, 'forgot_password'])->name('forgot.password');
Route::post('/forgot-password-code', [AuthController::class, 'forgot_password_code'])->name('forgot.password.code');
Route::post('/forgot-password-reset', [AuthController::class, 'forgot_password_reset'])->name('forgot.password.reset');
Route::get('/getcount',[AuthController::class, 'getcount'])->name('count');
//Tutorials
        Route::get('/app/tutorials-list',[AdminController::class,'tutolist'])->name('tuto.app.get');


Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/me', function(Request $request) {
     
        if(auth()->user())
        {
            return auth()->user();
        }
        else
        {
           return response()->json(['user'=>'No user Found']);
        }
        
    });
    Route::post('/auth/useredit', [AuthController::class, 'useredit'])->name('user.edit');
    Route::post('/auth/logout', [AuthController::class, 'logout']);
    Route::post('/send-me-verification-code',[EmailController::class, 'sendEmailCode'])->name('send.email.code');
    Route::post('/verify-code',[EmailController::class, 'VerifyCode'])->name('verify.email.code');
    Route::post('/send-me-mobile-code',[EmailController::class, 'SendOtpMobile'])->name('send.mobile.code');
    
    Route::post('/send-inquiry',[AppController::class, 'newInquiry'])->name('send.inquiry');
    Route::get('/issue-list',[AdminController::class,'getissuelist'])->name('get.issue');
    
    
    Route::get('/safe-list-app',[AppController::class, 'Appsafelist'])->name('safe.listing.app');
    
    
    Route::middleware(['admin'])->group(function () {
    // ...
    
        Route::get('/admin/dashboarddata',[AdminController::class, 'dashboardlistings'])->name('dashboard.listing');
        Route::post('/useredit/{user}', [AuthController::class, 'useredit'])->name('user.edit');
        Route::get('/admin/user-listing',[AdminController::class, 'userlisting'])->name('user.listing');
        Route::get('/admin/get-user/{user}',[AdminController::class, 'specificuserdata'])->name('user.data');
        // Route::post('/admin/edit-user/{user}',[AdminController::class, 'specificuserdataedit'])->name('user.updatedata');
        Route::post('/admin/update_status_user/{user}',[AdminController::class, 'activeinactiveuser'])->name('user.updatestatususer');
        Route::get('/admin/view-specfic-user-safes/{id}',[AdminController::class, 'viewSpecificUserSafe'])->name('issue.viewspecificusersafes');
        Route::post('/admin/usereditspecific/{user}',[AdminController::class,'editspecificuser'])->name('user.updatespecific');
        
        Route::get('/admin/issue-listing',[AdminController::class, 'issuelisting'])->name('issue.listing');
        Route::get('/admin/view-issue/{issue}',[AdminController::class, 'viewIssue'])->name('issue.view');
        Route::post('/admin/update-issue/{issue}',[AdminController::class, 'updateIssue'])->name('issue.update');
        Route::get('/admin/view-specfic-user-isssue/{id}',[AdminController::class, 'viewSpecificUserIssue'])->name('issue.viewspecificuserissues');
        Route::post('/admin/update_status_issue/{id}',[AdminController::class, 'activeinactiveissue'])->name('user.updatestatusissue');
        Route::post('/admin/issue-add',[AdminController::class, 'addIssue'])->name('issue.add');
        
        //issuetype
        Route::get('/admin/getissuetype',[AdminController::class,'getissuelist'])->name('issuetype.get');
        Route::post('/admin/issuetype-add',[AdminController::class,'addIssueType'])->name('issuetype.add');
        Route::post('/admin/issuetype-update/{issuetype}',[AdminController::class,'updateIssueType'])->name('issuetype.update');
        
        //safes api
        Route::post('/admin/safe-add-edit/{safe?}',[AdminController::class, 'addSafe'])->name('add.update.safe');
        Route::get('/admin/safe-list',[AdminController::class, 'safelist'])->name('safe.listing');
        Route::get('/admin/view-safe/{safe}',[AdminController::class, 'viewSafe'])->name('safe.view');
        
        
        //Tutorials
        Route::get('/admin/tutorials-list',[AdminController::class,'tutolist'])->name('tuto.admin.get');
        Route::post('/admin/tutorial-add-edit/{tu?}',[AdminController::class,'tutoaddedit'])->name('tuto.admin.add.edit');
        
        
    });
    
});