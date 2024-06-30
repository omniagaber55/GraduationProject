class ProductModel {
  final dynamic id;
  final String name;
  final String location;
  final dynamic price;
  final dynamic amount;

  ProductModel({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.amount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'],
      name: jsonData['name'],
      location: jsonData['location'],
      price: jsonData['price'],
      amount: jsonData['amount'],
    );
  }
}

