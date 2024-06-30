class DeviceModel {
  final String name;
  final String location;
  final double price;
  final int amount;

  DeviceModel({
    required this.name,
    required this.location,
    required this.price,
    required this.amount,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      name: json['name'],
      location: json['location'],
      price: json['price'].toDouble(),
      amount: json['amount'],
    );
  }
}