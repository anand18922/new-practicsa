<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class ClassData extends Controller
{
    public  function getData()
    {
        $class = DB::table('class')->get();
          return response()->json(['Message'=>'class get success','Data'=>$class]);
    }
}