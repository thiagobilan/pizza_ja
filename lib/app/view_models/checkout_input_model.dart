import 'dart:convert';

class CheckoutInputModel {
  int userId;
  String address;
  String paymentType;
  List<int> itemsId;
  CheckoutInputModel({
    required this.userId,
    required this.address,
    required this.paymentType,
    required this.itemsId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'address': address,
      'paymentType': paymentType,
      'itemsId': itemsId,
    };
  }

  factory CheckoutInputModel.fromMap(Map<String, dynamic> map) {
    return CheckoutInputModel(
      userId: map['userId'],
      address: map['address'],
      paymentType: map['paymentType'],
      itemsId: List<int>.from(map['itemsId']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckoutInputModel.fromJson(String source) =>
      CheckoutInputModel.fromMap(json.decode(source));
}
