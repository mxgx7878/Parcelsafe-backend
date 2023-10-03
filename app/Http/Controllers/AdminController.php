<?php
namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Inquiry;
use App\Models\Safes;
use App\Models\Tutorials;
use App\Models\IssueType;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use Exception;

use Illuminate\Support\Str;

class AdminController extends Controller
{
    public function dashboardlistings()
    {
        $user = User::count();
        $issue = Inquiry::count();
        $activeuser = User::where('status',1)->count();
        $inactiveuser = User::where('status',0)->count();
        $issuespending = Inquiry::where('status',1)->count();
        
        
        return response()->json(['success'=>true,'data'=> ['total_user'=>$user,'total_issues'=>$issue,'active_user'=>$activeuser,'inactive_user'=>$inactiveuser,'issue_pending'=>$issuespending]]);
    }
    public function getissuelist()
    {
        $issuestype = IssueType::get();
        
        if(!$issuestype)
        {
            return response()->json(['status'=>false,'msg'=>'Something wrong happend!']);
        }
        return response()->json(['status'=>true,'issuestype'=>$issuestype]);
    }
    public function userlisting()
    {
        $user = User::where('user_role',2)->get();
        $user = $user->toArray();
        return response()->json(['status'=>true,'users'=>$user]);
    }
    public function editspecificuser(Request $req,User $user)
    {
    //   dd($request);
    //   $user = User::where('id',Auth::user()->id)->first();
        $user->address_1 = (isset($req->address_1)?$req->address_1:$user->address_1);
        $user->address_2 = (isset($req->address_2)?$req->address_2:$user->address_2);
        $user->city = (isset($req->city)?$req->city:$user->city);
        $user->postal_code = (isset($req->postal_code)?$req->postal_code:$user->postal_code);
        $user->country = (isset($req->country)?$req->country:$user->country);
        $user->name = (isset($req->name)?$req->name:$user->name);
        $user->email = (isset($req->email)?$req->email:$user->email);
        $user->number = (isset($req->number)?$req->number:$user->number);
        $user->status = (isset($req->status)?intval($req->status):$user->status);

       
            // $check = $user->update($request->all());
        if($user->save())
        {
          return [
            'message' => 'User Edit Successfully',
            'status'=>true,
            'data'=>$user,
        ];  
        }
         return $this->error('Error In saving data', 500);
    }
    public function specificuserdata(Request $request, User $user)
    {
        $u = $user->toArray();
        return response()->json(['status'=>true,'users'=>$u]);
    }
     public function activeinactiveuser(Request $request,User $user){
        
        
        if($user->status == 1 )
        {
            $user->update([
                'status'=>0
                ]);
                
              return Response()->json(['status'=>true,'msg'=>"User Successfully Inactive",]);
        }
        elseif($user->status == 0)
        {
             $user->update([
                'status'=>1
                ]);
                
              return Response()->json(['status'=>true,'msg'=>"User Successfully Active"]);    
        }
    }
    
    public function tutolist()
    {
        $tuto = Tutorials::get();
        $tuto = $tuto->toArray();
        return response()->json(['status'=>true,'tutorials'=>$tuto]);
    }
    
    public function tutoaddedit(Request $req, Tutorials $tu)
    {
        $created =0;
        if(isset($tu->id) && $tu->id>0)
        {
            $created =1;
        }
        $validate = [
            'heading'=>'required',
            'content'=>'required',
            ];
            
             $validator = Validator::make($req->all(), $validate);
        if ($validator->fails()) 
        {
                $errors = $validator->errors()->toArray();
                return response()->json(['status' => false, 'errors' => $errors], 400);
        }
        if($req->has(file))
        {
            $imageName = time().'.'.$req->file->getClientOriginalExtension();
            dd($imageName);
            $req->file->move(public_path('/template'), $imageName);
     
        
        
        }
        $tu->content = $req->content;
        $tu->heading = $req->heading;
        if($tu->save())
        {
            if($created == 0)
            {
                return response()->json(['status' => true, 'msg' => 'Added Succesfully'], 200);
            }
            else
            {
                return response()->json(['status' => true, 'msg' => 'Updated Succesfully'], 200);
            }
        }
    }
    public function issuelisting()
    {
        $inq = Inquiry::with('user')->get();
        $inq = $inq->toArray();
        return response()->json(['status'=>true,'inquiries'=>$inq]);
    }
    
    
    public function viewIssue(Inquiry $issue)
    {
        $inquiry = $issue->toArray();
        $inquiry['user'] = $issue->user->toArray();
        return response()->json(['status'=>true,'inquiry'=>$inquiry]);
        // dd($inquiry);
    }
    public function updateIssue(Request $req, Inquiry $issue)
    {
        
        $issue->status = $req->status;
        $issue->resolution = $req->resolution;
        // dd($issue);
        $issue->save();
        
        return response()->json(['status'=>true,'inquiry'=>$issue]);
    }
    
    ///Safes API
    public function addSafe(Request $request,Safes $safe)
    {
        
        $create= isset($safe->id)?0:1;
        $msg= isset($safe->id)?'Updated Succesfully':'Added Succesfully';
  
        if($create==1)
        {
            $validate = [
            'name' => 'string|max:255|unique:safes',
            'address'=>'required',
            'city'=>'required',
            'state'=>'required',
            'postal_code'=>'required',
            'status'=>'required',
            'safe_state'=>'required',
            'subscription_status'=>'required',
            ];
        }
        else
        {
           $validate = [
            'name' => 'string|max:255',
            'address'=>'required',
            'city'=>'required',
            'state'=>'required',
            'postal_code'=>'required',
            'status'=>'required',
            'safe_state'=>'required',
            'subscription_status'=>'required',
            ];
        }
   
        $validator = Validator::make($request->all(), $validate);
            if ($validator->fails()) {
                $errors = $validator->errors()->toArray();
                return response()->json(['status' => false, 'errors' => $errors], 400);
            }
            if($create==1)
            {
                $safe->serial_number = Str::substr($request->name, 0, 2).'-'.Carbon::parse(date('Y-m-d'))->timestamp;
            
            }
            $safe->name= $request->name;
            $safe->address= $request->address;
            $safe->city= $request->city;
            $safe->state= $request->state;
            $safe->postal_code= $request->postal_code;
            $safe->status= intval($request->status);
            $safe->safe_state= intval($request->safe_state);
            $safe->subscription_status= intval($request->subscription_status);
            if($safe->save())
            {
                 return response()->json(['status'=>true,'safe'=>$safe,'msg'=>$msg]);
            }
            else
            {
                return response()->json(['status'=>false,'msg'=>'Error']);
            }
       
    }
    
    public function viewSpecificUserIssue($id)
    {
        $issues = Inquiry::where('user_id',$id)->get();
        return response()->json(['status'=>true,'data'=>$issues]);
    }
    
    // public function specificuserdataedit(Request $request,User $user)
    // {
    //     if($request->all() == [])
    //     {
    //          return Response()->json(['status'=>false,'msg'=>'Please Provide Data to Edit']);
    //     }
        
        
        
    //     $user->update($request->all());
    //     // return Response()->json($user);
    //     return Response()->json(['status'=>true,'data'=>$request->all(),'datauser'=>$user]);
    // }
      public function activeinactiveissue(Request $request,$id){
        
        $inquiry = Inquiry::where('id',$id)->first();
        
        
        if($inquiry->status == 1)
        {
            
            $inquiry->update([
                'status'=>0
                ]);
                
              return Response()->json(['status'=>true,'msg'=>"Issue Successfully Inactive",]);
        }
        elseif($inquiry->status == 0)
        {
             $inquiry->update([
                'status'=>1
                ]);
                
              return Response()->json(['status'=>true,'msg'=>"Issue Successfully Active"]);    
        }
    }
    
    public function addIssueType(Request $request)
    {
        
        
         $validate = [
            'name'=>'required',
            'status'=>'required',
            ];
            
             $validator = Validator::make($request->all(), $validate);
        if ($validator->fails()) 
        {
                $errors = $validator->errors()->toArray();
                return response()->json(['status' => false, 'errors' => $errors], 400);
        }
        
        $issue = new IssueType();
        $issue->name = $request->name;
        $issue->status = $request->status;
        
        
            if($issue->save())
            {
                 return response()->json(['status'=>true,'issuetype'=>$issue,'msg'=>'success']);
            }
            else
            {
                return response()->json(['status'=>false,'msg'=>'Error']);
            }
        
            
            
    }
     public function updateIssueType(Request $request,IssueType $issuetype)
    {
       $check = $issuetype->update($request->all());
       
       if($check)
            {
                 return response()->json(['status'=>true,'issuetype'=>$check,'msg'=>'success']);
            }
            else
            {
                return response()->json(['status'=>false,'msg'=>'Error']);
            }
        
        
    }
   public function addIssue(Request $request)
   {
       $validate = [
            'issue'=>'required',
            'message'=>'required',
            'resolution'=>'required',
            ];
            
        $validator = Validator::make($request->all(), $validate);
        if ($validator->fails()) 
        {
                $errors = $validator->errors()->toArray();
                return response()->json(['status' => false, 'errors' => $errors], 400);
        }
        
        // return Auth::user()->id;
        
        $inquiry = Inquiry::create([
            "user_id"=>Auth::user()->id,
            "issue"=>$request->issue,
            "message"=>$request->message,
            "status"=>1,
            "resolution"=>$request->resolution,
            ]);
            
        if(!$inquiry)
        {
            return response()->json(['status'=>false,'issue'=>$inquiry,'msg'=>'issue Did not Add']);
        }
        else
        {
            return response()->json(['status'=>true,'issue'=>$inquiry,'msg'=>'issue Add Successfully']);
        }
            
            
            
       
   }
    
     public function viewSpecificUserSafe($id)
    {
        $safes = Safes::where('main_user_id',$id)->get();
        return response()->json(['status'=>true,'data'=>$safes]);
    }
    public function safelist()
    {
        $safes = Safes::get();
        if($safes==null)
        {
           return response()->json(['status'=>fakse,'error'=>'Try back later']); 
        }
        $safes = $safes->toArray();
        return response()->json(['status'=>true,'safes'=>$safes]);
    }
    public function viewSafe(Safes $safe)
    {
        $safe = $safe->toArray();
        return response()->json(['status'=>true,'safe'=>$safe]);
    }
}