<?php

namespace App\Http\Controllers\Admin\Cms;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session ;
use Illuminate\Support\Facades\Storage;



class GeneralController extends Controller{
//update views accordingly
    protected $table = "hotel_rest";

    //1. show all records
    public function show(){
        $table = "general_det";
       
        if (Session::has('loginId')) {
            $user_id = Session::get('loginId');
            $user_data = DB::table('users')
            ->where('id', $user_id)
            ->get()
            ->first();       
        }
        $secdata = DB::table('section')->get();
        $all_data = DB::table($table)->get();
        //print_r($user_data);exit;
        return view('admin.cms.general', [
            'all_data' => $all_data, 
            'user_data'=> $user_data,
            'secdata' => $secdata
            ]);

    }

    public function createSection(Request $req){
        $table = "section";
        date_default_timezone_set('Asia/Kolkata');
        $create_array = array (
            'sec_title' => $req->input('sec_title'),
            'created_at' => date('Y-m-d')
        );
        $res = DB::table($table)->insert($create_array);
        if ($res) {
            $req->session()->flash('reg_msg', 'You have successfully entered new section.');             
        }else{
            echo "none";exit;
            $req->session()->flash('reg_msg', 'Sorry creation of new section not completed.');
        }
        return redirect('cms');

    }

    public function removeSection($id){
        $table = "section";
        $data = (array) DB::table($table)
            ->where('id', $id)
            ->get()
            ->first();

        if($data){

            $affected = DB::table($table)
            ->where('id', $id)
            ->delete();

        if ($affected == 1) {
                
            session()->flash('rec_del', 'Record deleted successfully!'); 
            return redirect('cms');
        }else{
            dd($affected);
            }
    }
    }
    //2. create a record
    public function create(Request $req){
       
        $table = "general_det";
    
        
        // variable declaration
        $create_rules = array(
         
           //'image' =>  'mimes:png,gif,jpeg,jpg|required',
           'section' => 'required'
           
        );

        //file upload to public/docs/hotels/restaurants
        date_default_timezone_set('Asia/Kolkata');
        if ($req->hasfile('image')) {
           
      
            $file = $req->file('image');
            $filename = time().'-'.$file->getClientOriginalName();
            $destination = public_path('general');
            $file->move($destination, $filename);
          
            $create_array = array (
                'image' => $filename,
                'title' => $req->input('title'),
                'section' => $req->input('section'),
                'subtitle1' => $req->input('subtitle1'),
                'subtitle2' => $req->input('subtitle2'),
                'subtitle3' => $req->input('subtitle3'),
                'link' => $req->input('link'),
                'link_text' => $req->input('link_text'),
                'description' => $req->input('description'),
                'created_at' => date('Y-m-d')
            );
            //echo $create_array['image'].$create_array['title'];exit;
           
        }else{
            
            $create_array = array (
                'title' => $req->input('title'),
                'section' => $req->input('section'),
                'subtitle1' => $req->input('subtitle1'),
                'subtitle2' => $req->input('subtitle2'),
                'subtitle3' => $req->input('subtitle3'),
                'link' => $req->input('link'),
                'link_text' => $req->input('link_text'),
                'description' => $req->input('description'),
                'created_at' => date('Y-m-d')
            );
            

        }
      
       if (!empty($req->validate($create_rules))) {

            $res = DB::table($table)->insert($create_array);
             if ($res) {
                $req->session()->flash('reg_msg', 'You have successfully entered new record.');             
            }else{
                $req->session()->flash('reg_msg', 'Sorry creation of new record not completed.');
            }
            return redirect('cms');
        
        }

    }

    //3. delete record
    public function remove($id){
        $table = "general_det";
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
            return redirect('login');
        }else{
            dd($affected);
            }
        
    }



    }

   

}
