<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Auth;
use JWTAuth;
class login extends Controller
{

   public function insert(Request $request)
    {
        echo"hello";
      $x=  DB::table('login')->insert([
    'name' => $request->name,
    'email' => $request->email,
    // 'id' => $request->id,
    'password' => $request->password,

    
        ]);
       return response()->json(['Message'=>$x]); 
    }


  
    // public function register(Request $request){
    //     $plainPassword=$request->password;
    //     $password=bcrypt($request->password);
    //     $request->request->add(['password' => $password]);
 
    //     // create the user account 
    //     $created=User::create($request->all());
    //     $request->request->add(['password' => $plainPassword]);
    //     // login now..
    //     return $this->login($request);
    // }
    // public function login(Request $request)
    // {
        
    //     $input = $request->only('email', 'password');
    //     $jwt_token = null;
    //     if (!$jwt_token = JWTAuth::attempt($input)) {
    //         return response()->json([
    //             'success' => false,
    //             'message' => 'Invalid Email or Password',
    //         ], 401);
    //     }
    //     // get the user 
    //     $user = Auth::user();
       
    //     return response()->json([
    //         'success' => true,
    //         'token' => $jwt_token,
    //         'user' => $user
    //     ]);
    // }


    
}