import 'package:flutter/cupertino.dart';

import '../helper/db_helper.dart';
import '../modals/food_models.dart';
import '../utils/list.dart';
import '../view/home_screens.dart';

class ProductProvider extends ChangeNotifier{
List<Foods> cartProduct = [];
Future<List<Foods>>? dbFood;
Future<List<Foods>>? dbLike;
List<bool> starList = List.generate(20, (index) => false);
bool like = false;
bool likes = false;
int i = 0;

void fetchdata(){
  dbFood = DBhelper.dBhelper.fetchData();
  notifyListeners();
}
void likefetchdata(){
  dbLike = DBhelper.dBhelper.likecategory(val: "true");

  notifyListeners();
}
void islike({required Foods name}){

  DBhelper.dBhelper.update(name: name.foodName, like: 'false');

  notifyListeners();
}

void likeProduct({required Foods likeList,required int i}){
  starList[i] =!starList[i];
  DBhelper.dBhelper.update(name: likeList.foodName, like: starList[i].toString());
  likes = starList[i];
  dbFood = DBhelper.dBhelper.fetchData();
  likeList.like = starList[i].toString();
  notifyListeners();
}



void addproduct({required Foods productList}){

  for (Foods addProduct in cartProduct) {
    if (addProduct.id == productList.id) {
      productList.quantity = productList.quantity + 1;
      i = 1;
      notifyListeners();
    }
    notifyListeners();
  }
  if (i == 0) {
    cartProduct.add(productList);
    notifyListeners();
  }
}
void removeProduct({required Foods food}){
  if (food.quantity > 1) {
    food.quantity = food.quantity - 1;
    print(food.quantity);
   // food.dummyPrice = food.price * product.quantity;
    notifyListeners();
  } else {
    print("else ${food.quantity}");
    cartProduct.remove(food);
    notifyListeners();
  }
}
}