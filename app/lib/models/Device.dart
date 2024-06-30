class DeviceModel {
  final dynamic id;
  final String name;
  final String location;
  final dynamic price;
  final dynamic amount;


DeviceModel({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.amount,
  });

  factory DeviceModel.fromJson(jsonData) {
    return DeviceModel(
      id: jsonData['id'],
      name: jsonData['category'],
     location: jsonData['category'],
      price: jsonData['price'],
      amount: jsonData['price'],
    );
  }
}
