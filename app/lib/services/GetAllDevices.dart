import 'dart:convert';



import 'package:app/helper/api.dart';
import 'package:app/models/Device.dart';
import 'package:http/http.dart';


class AllProductsService {
  Future<List<DeviceModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<DeviceModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
       DeviceModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}



class AllCategoriesService {
  Future<List<dynamic>> getAllCateogires() async {
    
 List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products/categories');
  
  return data;

  }
}