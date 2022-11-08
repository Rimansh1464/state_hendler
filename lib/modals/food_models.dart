
import 'dart:convert';

List<Foods> foodFromJson(String str) =>
    List<Foods>.from(json.decode(str).map((x) => Foods.fromMap(data: x)));
class Food {
  String? foodName;
  String? price;
  String? like;
  String? image;

  Food({
    required this.foodName,
    required this.price,
    required this.like,
    required this.image,
  });

  factory Food.database({required Map data}) {
    return Food(
      foodName: data["foodName"],
      price: data["price"],
      like: data["like"],
      image: data["image"],


    );
  }
}

class Foods {
  int id;
  String foodName;
  int price;
  String image;
  int quantity;
  String like;


  Foods({
    required this.id,
    required this.foodName,
    required this.price,
    required this.image,
    required this.quantity,
    required this.like,

  });

  factory Foods.fromMap({required Map data}) {
    return Foods(
      id: data["id"],
      foodName: data["foodName"],
      price: data["price"],
      image: data["image"],
      quantity: data["quantity"],
      like: data["like"],
    );
  }
}