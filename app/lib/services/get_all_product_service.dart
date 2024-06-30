import 'package:app/helper/api.dart';
import 'package:app/models/market.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api()
        .get(url: 'https://3b3a-197-43-150-8.ngrok-free.app/api/show-items');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
