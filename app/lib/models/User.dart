class User {
  final int id;
  final String name;
  final String address;
  final String email;
  final String role;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      email: json['email'],
      role: json['role'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}