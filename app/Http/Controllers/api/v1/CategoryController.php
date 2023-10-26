<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\CategoryManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Category;

class CategoryController extends Controller
{
    public function get_categories()
    {
        try {
            $categories = Category::with(['childes.childes'])->where(['position' => 0])->priority()->get();
            return response()->json($categories, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }

    public function get_products($id)
    {   
         $products=Helpers::product_data_formatting(CategoryManager::products($id), true);
         $sub=CategoryManager::child($id);
        return response()->json(['products'=>$products,'sub_categories'=>$sub], 200);
    }
        public function get_products_by_sub($category_id,$sub)
    {   
         $products=Helpers::product_data_formatting(CategoryManager::products($sub), true);
         $sub=CategoryManager::child($category_id);
        return response()->json(['products'=>$products,'sub_categories'=>$sub], 200);
    }
    
    
    
}
