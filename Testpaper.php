<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class Testpaper extends Controller
{

  public function getTestpaper($id)
  {
    

    $test_paper = DB::table('test_paper')->where('class_name',$id)->get();
          return response()->json(['Message'=>'class get success','Data'=>$test_paper]);
   }


}