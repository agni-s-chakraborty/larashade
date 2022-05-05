<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session ;
use Illuminate\Support\Facades\DB;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


class CustomAuthController extends Controller
{
    // 
    function dashboard(){

        if (Session::has('loginId')) {
            $user_id = Session::get('loginId');
            $user_data = DB::table('users')
            ->where('id', $user_id)
            ->get()
            ->first();       
        }
        $all_data = DB::table('users')
        ->get()->all();
        //echo "<pre>";
        //print_r($all_data);exit;
        return view('admin.dashboard', [
           
            'user_data' => $user_data, 
            'all_data' => $all_data
        ]);
    }

    public function doLogin(Request $req){

        $rules = array(

            'email' => 'email|required',
            'password' => 'required'
        );
        $validator = $req->validate($rules);
        if (!empty($validator)){
            
            $user = (array) DB::table('users')
                ->where('email', $req->input('email'))
                ->get()
                ->first();
                
                if($user){
                    if (Hash::check($req->input('password'), $user['password'])) {
                        $req->session()->put('loginId', $user['id']);
                        return redirect('dashboard');
                        
                    }else {
                        $req->session()->flash('err_login', 'Sorry Password is not matched'); 
                        return redirect('login');
                    }
                }else{
                    $req->session()->flash('err_login', 'Sorry Email is not matched'); 
                    return redirect('login');
                }
                

            }
            
        }

    function logout(){

        if (Session::has('loginId')) {
            Session::pull('loginId');
            session()->flash('err_login', 'You are logged out'); 
            return redirect('login');
            

        }

    }

    function doRegister(Request $req){

        $rules = array(

            'name' => 'required',
            'email' => 'email|required|unique:users',
            'password' => 'required',
            'password_confirmation' => 'required|required_with:password|same:password'
        );

        $validator = $req->validate($rules);

        if (!empty($validator)) {
            
            $res = DB::table('users')
            ->insert([
                'name' => $req->input('name'),
                'email' => $req->input('email'),
                'password' => Hash::make($req->input('password')),
                'is_admin' => $req->input('is_admin'),
                'created_at' => date('Y-m-d')
            ]);
            
            if ($res) {

                $req->session()->flash('succ_msg', 'You are registered with us.');
               
            }else{

                $req->session()->flash('succ_msg', 'Sorry registration not complete yet.');

            }

            if (Session::has('loginId')) {
                return redirect('dashboard');
            }else {
                return redirect('login');
            }
            
        }

    }

    function doVerify(Request $req){

        $email = $req->input('email');
        $subject = "Password Reset Request from Capital Concierge";
        $mailbody = random_int(99999, 999999999);
        $rules = array(

            'email' => 'email|required'
        );
        $validator = $req->validate($rules);
        if (!empty($validator)){
            
            $user = (array) DB::table('users')
                ->where('email', $req->input('email'))
                ->get()
                ->first();
            if($user){
               
                // send otp via PHPMailer
                require base_path("vendor/autoload.php");
                $mail = new PHPMailer(true);     // Passing `true` enables exceptions
        
                try {
        
                   // SMTP configuration
                $mail->isSMTP();
                $mail->Host     = 'melocare.pw';
                $mail->SMTPAuth = true;
                $mail->Username = 'info@melocare.pw';
                $mail->Password = 'Melo@care';
                $mail->SMTPSecure = 'ssl';
                $mail->Port     = 465;
                
                $mail->setFrom('info@melocare.pw', 'Melocare');
                $mail->addReplyTo($email, 'Melocare');
                
                // Add a recipient
                $mail->addAddress($email);
              
                // Email subject
                $mail->Subject = $subject;
                
                // Set email format to HTML
                $mail->isHTML(true);
                
                // Email body content
               
                $mail->Body = $mailbody;
        
                    if( !$mail->send() ) {
                        return back()->with("failed", "Email not sent.")->withErrors($mail->ErrorInfo);
                    }
                    
                    else {
                       
                        $req->session()->flash('succ_msg', 'Check your mail for OTP!');
                        $req->session()->flash('token', $mailbody);
                        $req->session()->flash('email', $email);
                        return redirect('reset');
                    }
        
                } catch (Exception $e) {
                    $req->session()->flash('err_login', 'Sorry Email could not be sent');
                    return redirect('verify');
                }
            }else{
                $req->session()->flash('err_login', 'Sorry Email is not matched'); 
                return redirect('login');
            }

         }
    }



    public function doReset(Request $req){

        $rules = array(

            'token' => 'required',
            'hidden_token' => 'required|required_with:token|same:token',
            'password' => 'required',
            'password_confirmation' => 'required|required_with:password|same:password'
        );

        $validator = $req->validate($rules);

        if (!empty($validator)) {

            $affected = DB::table('users')
              ->where('email', $req->input('email'))
              ->update(['password' => Hash::make($req->input('password'))]);
        }

        if ($affected == 1) {
            
            $req->session()->flash('succ_msg', 'Password updated successfully! Please login with new password!'); 
            return redirect('login');
        }else{

            dd($affected);
        }
}



}