class Chat {
  int id;
  String senderName;
  String receiverName;
  DateTime createdAt;
  DateTime updatedAt;

  Chat({
    required this.id,
    required this.senderName,
    required this.receiverName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      senderName: json['sender_name'],
      receiverName: json['receiver_name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
