<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class question extends Controller
{
    public function getquestion($id,$testid)
  {
    

    $test_paper = DB::table('question')->where('class_name',$id)->where('test_paper_id',$testid)->get();
          return response()->json(['Message'=>'class get success','Data'=>$test_paper]);
   }





}
