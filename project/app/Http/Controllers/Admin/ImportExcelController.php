<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Datatables;
use App\Models\Pincode;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;


class ImportExcelController extends Controller
{
    function index()
    {
    	return view('admin.import.pincode');
    }

    public function datatables(Request $request)
    {
        $pincode = new Pincode;
        
        $datas = $pincode->orderBy('id','desc')->get();
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            ->toJson(); //--- Returning Json Data To Client Side
    }

    public function import(Request $request)
    {   
        
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($request->excel);
        // var_dump($spreadsheet);
        
        $worksheet = $spreadsheet->getActiveSheet();

        foreach ($worksheet->toArray() as $row) {
            if (isset($row[0]) && !empty($row[0]) && strtolower(str_replace(' ', '', $row[0]))!="pincode") {
                $pincode = new Pincode;
                $pincode->pincode = $row[0];
                $pincode->save();
            }
        }

        return redirect('admin/import/pincode');
    }
}
