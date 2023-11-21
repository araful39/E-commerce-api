

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ecommerce_model.dart';



class ApiService {


Future<List<ProductModel>> getAllproduct()async{

 var all_product="https://fakestoreapi.com/products";



var response=await http.get(Uri.parse(all_product));


if(response.statusCode==200){
  List jsonList=json.decode(response.body);
return jsonList.map((json) => ProductModel.fromJson(json)).toList();


}else{
  throw ("Failed to load data");
}
 // print("Response : ${response.statusCode}");
  // final response=await get(Uri.parse("https://fakestoreapi.com/products"));
  // if(response.statusCode==200){
  //   Map<String,dynamic> data =json.decode(response.body);
  //   return ProductModel.fromJson(data);
  // }else{
  //   throw Exception("Failed to loat data");
  // }
}
}


