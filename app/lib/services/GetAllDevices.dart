import 'package:app/helper/api.dart';
import 'package:app/models/Device.dart';

class AllDeviceService {
  Future<List<DeviceModel>> getAllProducts() async {
    dynamic response = await Api().get(
      url: 'https://9a32-197-43-150-8.ngrok-free.app/api/show-devices',
      token: 'Bearer 34|Mipz0l9B1FC5zN2inzK7c1Z5o5oHys3pbzkOpar6d8b7be6f',
    );

    if (response is List) {
      List<DeviceModel> productsList = [];
      for (int i = 0; i < response.length; i++) {
        productsList.add(DeviceModel.fromJson(response[i]));
      }
      return productsList;
    } else {
      throw Exception('API returned unexpected response: $response');
    }
  }
}

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
