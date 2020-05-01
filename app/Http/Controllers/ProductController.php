<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use App\Product;
use App\CsvData;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $product = Product::paginate(10);
        return view('product.index', ['product' => $product]);
    }

    public function parseImport(Request $request)
    {
        $path = $request->file('csv_file')->getRealPath();
        $data = array_map('str_getcsv', file($path));
    
        $csv_data_file = CsvData::create([
            'csv_filename' => $request->file('csv_file')->getClientOriginalName(),
            'csv_header' => $request->has('header'),
            'csv_data' => json_encode($data)
        ]);
    
        $csv_data = array_slice($data, 0, 2);
        return view('product.import_fields', compact('csv_data', 'csv_data_file'));
    }

    public function processImport(Request $request)
    {
        $data = CsvData::find($request->csv_data_file_id);
        $csv_data = json_decode($data->csv_data, true);
        //echo "<pre>"; print_r($request->fields); exit;
        $i=0;
        foreach ($csv_data as $row) {
            $sku_exist = 0;
            if($i != 0){
                $product = new Product();
                foreach (config('app.db_fields') as $index => $field) {
                    if($field == 'sku'){
                        $sku = $row[$request->fields[$index]];
                        $sku_data = DB::table('products')->where('sku', $sku)->first();
                        if(!empty($sku_data)){
                            $sku_exist = 1;
                        }
                    }

                     if($field == 'category_id'){
                        $category_id = explode('|',$row[$request->fields[$index]]);
                        $cat_id = array();
                        foreach($category_id as $key){
                            $cadata = DB::table('categories')->where('title', $key)->first();
                            if(empty($cadata)){
                                $category = new Category();
                                $category->title = $key;
                                $category->save();
                                $cat_id[] = $category->id;
                            }else{
                                $cat_id[] = $cadata->id;
                            }
                        }
                        $product->$field = implode(',',$cat_id);
                     }else{
                        $product->$field = $row[$request->fields[$index]];
                     }

                }
                if($sku_exist == 0){
                    $product->save();
                }
                
            }
            $i++;
        }

        return redirect('/product')->with('success', 'Product Info saved!');
    }
    
}