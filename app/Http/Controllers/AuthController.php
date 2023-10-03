<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Count;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Exception;
use Twilio\Rest\Client;
use Mail;

class AuthController extends Controller
{
    use ApiResponser;

    public function register(Request $request)
    {
//         $validator = \Validator::make($request->all(), [ 
//       'name' => 'required|string|max:255',
//             'email' => 'required|string|email|unique:users,email',
//             'password' => 'required|string|min:6'
//   ]);
//   if ($validator->fails()) {
//       $error = $validator->errors()->toArray();
//     //   dd($error);
//   $responseError = [];
//       isset($error['name'])? $responseError['name'] = $error['name'][0] : null;
//      isset($error['email'])? $responseError['email'] = $error['email'][0] : null;
//      isset($error['password'])? $responseError['password'] = $error['password'][0] : null;
//     //  dd($validator->errors()->toArray());
//     return response()->json(['status'=>false,'errors'=> $responseError], 400);
//   }
        
        $requiredValidator = \Validator::make($request->all(), [
        'name' => 'required',
        'email' => 'required',
        'password' => 'required',
        'address_1'=>'required',
        'city'=>'required',
        'country'=>'required',
        'postal_code'=>'required',
        'number'=>'required',
        ]);
        if ($requiredValidator->fails()) {
            $responseError = [];
            $errors = $requiredValidator->errors()->toArray();
                foreach ($errors as $field => $message) {
                    if (strpos(trim($field), "_") !== false) {
                        $fieldName =  ucfirst(implode(" ", explode("_", trim($field))));
                    } else {
                        $fieldName =  ucfirst(trim($field));
                    }
                    $errorFields[] = $fieldName;
                }
                $numFields = count($errorFields);
                $fieldNames = implode(", ", $errorFields);
                $responseError['email'] = "The " . ($numFields > 1 ? $fieldNames . " fields are" : $fieldNames . " field is") . " required.";
            return response()->json(['status' => false, 'errors' => $responseError], 400);
        }
        $validator = \Validator::make($request->all(), [
        'name' => 'string|max:255',
        'email' => 'string|email|unique:users,email',
        'password' => 'string|min:6',
        'address_1'=>'string',
        // 'address_2'=>'string',
        'city'=>'string',
        'country'=>'string',
        ]);
        
        //string validation not working 
        if ($validator->fails()) {
            $errors = $validator->errors()->toArray();
            return response()->json(['status' => false, 'errors' => $errors], 400);
        }
        
        // $attr = $request->validate([
        //     'name' => 'required|string|max:255',
        //     'email' => 'required|string|email|unique:users,email',
        //     'password' => 'required|string|min:6|confirmed',
        //     'address_1'=>'string',
        //     'address_2'=>'string',
        //     'city'=>'string',
        //     'country'=>'string',
        // ]);
        // dd($attr,$request);
        $user = new User();
        $user->name = $request->name;
        $user->password = bcrypt($request->password);
        $user->email= $request->email;
        $user->address_1= $request->address_1;
        $user->address_2= $request->address_2;
        $user->postal_code= $request->postal_code;
        $user->city= $request->city;
        $user->country= $request->country;
        $user->number= $request->number;
        $user->user_role= 2;
        $user->status=1;
        if($user->save())
        {
           return $this->success([
            'token' => $user->createToken('API Token')->plainTextToken
        ]); 
        }
        else
        {
            return response()->json(['status'=>false,'errors'=> 'some error'], 500);
        }
        
    }

    public function login(Request $request)
    {
        
        $attr = $request->validate([
            'email' => 'required|string|email|',
            'password' => 'required|string|min:6'
        ]);
        // dd(Auth::attempt($attr));

        if (!Auth::attempt($attr)) {
            return $this->error('Login credentials do not match', 401);
        }

        return $this->success([
            'token' => auth()->user()->createToken('API Token')->plainTextToken
        ]);
    }

    public function logout()
    {
        auth()->user()->tokens()->delete();

        return [
            'message' => 'Tokens Revoked',
            'status'=>true
        ];
    }
    
    public function nouser()
    {
        return $this->error('Login credentials do not match', 401);
    }
    
    public function useredit(Request $req)
    {
        $user = User::where('id',Auth::user()->id)->first();
        $user->address_1 = (isset($req->address_1)?$req->address_1:Auth::user()->address_1);
        $user->address_2 = (isset($req->address_2)?$req->address_2:Auth::user()->address_2);
        $user->city = (isset($req->city)?$req->city:Auth::user()->city);
        $user->postal_code = (isset($req->postal_code)?$req->postal_code:Auth::user()->postal_code);
        $user->country = (isset($req->country)?$req->country:Auth::user()->country);
        $user->name = (isset($req->name)?$req->name:Auth::user()->name);
        $user->email = (isset($req->email)?$req->email:Auth::user()->email);
        $user->number = (isset($req->number)?$req->number:Auth::user()->number);
        if($user->save())
        {
          return [
            'message' => 'Profile Updated',
            'status'=>true
        ];  
        }
         return $this->error('Error In saving data', 500);
       
    }
    
    public function forgot_password(Request $req)
    {
        $validator = \Validator::make($req->all(), [ 
        'forgot_user' => 'required|string|max:255'
        ]);
        if ($validator->fails()) 
        {
            $error = $validator->errors()->toArray();
            $responseError = [];
            isset($error['forgot_user'])? $responseError['forgot_user'] = $error['forgot_user'][0] : null;
            
            return response()->json(['status'=>false,'errors'=> $responseError], 400);
        }
        $type=null;
        if (str_contains($req->forgot_user, '@')) 
        { 
            $type="email";
        }
        else
        {
            $type="num";
        }
        
        
        if($type=="email")
        {
            $user = User::where('email',$req->forgot_user)->first();
            if($user!==null)
            {
               $randomNum = substr(str_shuffle("0123456789"), 0, 5);
                $user->forgot_password_code = $randomNum;
                if($user->save())
                {
                    $receiverNumber = $user->number;
                    $message = "This is your reset password code ".$randomNum;
                
                // try {
                
                //     $account_sid = getenv("TWILIO_SID");
                //     $auth_token = getenv("TWILIO_TOKEN");
                //     $twilio_number = getenv("TWILIO_FROM");
                    
                //     $client = new Client($account_sid, $auth_token);
                //     $client->messages->create($receiverNumber, [
                //     'from' => $twilio_number, 
                //     'body' => $message]);
                    
                //     // return ['status'=>1, 'msg'=>'A code is sent to your number','userid'=>$user->id];
                
                // } catch (Exception $e) {
                
                // return ['error'=>$e->getMessage()];
                // }
                    $details = [
                'code' => $randomNum,
                ];
                   $email=  \Mail::to('test@custom.mystagingserver.site')->send(new \App\Mail\EmailVerificationMail($details));
                   
                   return ['status'=>1,'msg'=>'A Reset code is sent to your email & number','userid'=>$user->id];
                } 
            }
            else
            {
                return ['status'=>0, 'msg'=>'This is not a registered email address'];
            }
        }
        if($type="num")
        {
            $user = User::where('number',$req->forgot_user)->first();
           // dd($user);
           if($user!==null)
           {
               $randomNum = substr(str_shuffle("0123456789"), 0, 5);
            $user->forgot_password_code = $randomNum;
            if($user->save())
            {
                $receiverNumber = $user->number;
                $message = "This is your code ".$randomNum;
                
                try {
                
                    $account_sid = getenv("TWILIO_SID");
                    $auth_token = getenv("TWILIO_TOKEN");
                    $twilio_number = getenv("TWILIO_FROM");
                    
                    $client = new Client($account_sid, $auth_token);
                    $client->messages->create($receiverNumber, [
                    'from' => $twilio_number, 
                    'body' => $message]);
                    
                    return ['status'=>1, 'msg'=>'A code is sent to your number','userid'=>$user->id];
                
                } catch (Exception $e) {
                
                return ['error'=>$e->getMessage()];
                }
               
            }
           }
           else
           {
            return ['status'=>0, 'msg'=>'Incorrect Number'];
           }
        }
        
    }
    
    public function forgot_password_code(Request $req)
    {
        $user = User::where('id',$req->userid)->where('forgot_password_code',$req->code)->first();
        if($user!==null)
        {
            return ['status'=>1, 'msg'=>'correct code','userid'=>$user->id];
        }
        else
        {
            return ['status'=>0, 'msg'=>'wrong code'];
        }
    }
    
    
    public function forgot_password_reset(Request $req)
    {
      
        $user = User::where('id',$req->userid)->first();
  
        if($user!==null)
        {
            $user->password = bcrypt($req->password);
            if($user->save())
            {
                return ['status'=>1, 'msg'=>'password updated'];
            }
        }
        else
        {
            return ['status'=>0, 'msg'=>'error'];
        }
    }
    
    public function getcount()
    {
        
        $count = Count::first();
        $count->count = $count->count+1;
        $count->save();
        if($count->count<10)
        {
            $c = '0000000'.$count->count;
        }
        if($count->count<99 && $count->count>=10)
        {
            $c = '000000'.$count->count;
        }
        if($count->count<999 && $count->count>=100)
        {
            $c = '00000'.$count->count;
        }
        return ['status'=>true,'data'=>$c];
        dd($count);
    }
}