<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
class UserTestData extends Controller
{
    
    public function index(Request $request)
    {
    	 $messages = [
    'required' => 'The  field is required.',
    'unique'=>'The Value is already Exist in Database'
];
      $validator = Validator::make($request->all(), [
           
             'sname' =>'required',
            
        ],$messages);

        if ($validator->fails()) {
            return redirect('user')
                        ->withErrors($validator)
                        ->withInput();
        }
    }

    public function GetData()
    {

        $users = DB::table('User')->get();
        return response()->json(['Message'=>'Data get Success','Data'=>$users]);

    }
    public function PostData(Request $request)
    {

        
        return response()->json(['userid'=>$request->userid]);

    }
}
