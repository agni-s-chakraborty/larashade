<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session ;
use App\Http\Controllers\Admin\CustomAuthController;


class MemberController extends Controller{

    //update views accordingly
    protected $table = "users";


    //1. show all records
    public function show(){

        
        // Instantiate CustomAuthController
        $auth_controller = new CustomAuthController;
        return $auth_controller->dashboard();      
    }

    //create a record
    public function create(Request $req){

        // variable declaration
        $create_rules = array(

            'name' => 'required',
            'email' => 'email|required|unique:users',
            'password' => 'required',
            'password_confirmation' => 'required|required_with:password|same:password'
        );

         $create_array = array (
                'name' => $req->input('name'),
                'email' => $req->input('email'),
                'created_at' => date('Y-m-d')
            );

       
        // function declaration

        $validator = $req->validate($create_rules);

        if (!empty($validator)) {

            $res = DB::table($table)
            ->insert($create_array);

            if ($res) {
                $req->session()->flash('reg_msg', 'You have successfully entered new record.');             
            }else{
                $req->session()->flash('reg_msg', 'Sorry creation of new record not completed.');
            }
            return redirect('register');
        }


    }

    //delete record
    public function remove($id){
        $table = "users";
        $data = (array) DB::table($table)
            ->where('id', $id)
            ->get()
            ->first();

        if($data){

            $affected = DB::table($table)
            ->where('id', $id)
            ->delete();

        if ($affected == 1) {
                
            session()->flash('succ_msg', 'Record deleted successfully!'); 
            return redirect('dashboard');
        }else{
            dd($affected);
            }
        
    }



    }

    //edit a record
    public function edit($id){

        $data = (array) DB::table($table)
                ->where('id', $id)
                ->get()
                ->first();

         if ($data) {
                
                return view('admin.dashboard', compact('data'));
           
            }

    }


    //update edited record
    public function update(Request $req, $id){

          // variable declaration
        $update_rules = array(

            'name' => 'required',
            'email' => 'email|required|unique:users',
            'password' => 'required',
            'password_confirmation' => 'required|required_with:password|same:password'
        );

         $update_array = array (
            'name' => $req->input('name'),
            'email' => $req->input('email'),
            'created_at' => date('Y-m-d')
            );

       
        // function declaration
         $validator = $req->validate($update_rules);

        if (!empty($validator)) {

            $affected = DB::table($table)
              ->where('id', $id)
              ->update($update_array);
        }

        if ($affected == 1) {
            
            $req->session()->flash('succ_msg', 'Password updated successfully! Please login with new password!'); 
            return redirect('login');
        }else{

            dd($affected);
        }


    }


    //update status of record
    public function status(Request $req){

        $user = User::find($request->user_id);
        $user->status = $request->status;
        $user->save();
  
        return response()->json(['success'=>'Status change successfully.']);

    }
}
