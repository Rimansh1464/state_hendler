import 'package:flutter/material.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/utils/cololrs.dart';
import 'package:food_app/utils/list.dart';
import 'package:provider/provider.dart';

class cart_screen extends StatefulWidget {
  const cart_screen({Key? key}) : super(key: key);

  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  print("====== ${Provider.of<ProductProvider>(context,listen: false).cartProduct.length}");
                },
                child: Text(
                  "Your Cart",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(itemCount: Provider.of<ProductProvider>(context).cartProduct.length,itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Center(
                                child: Image.asset("${FoodList[i].image}"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${FoodList[i].foodName}",
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "price : ${FoodList[i].price}",
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 33,
                                  width: 85,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          Provider.of<ProductProvider>(context,listen: false).addproduct(productList:Provider.of<ProductProvider>(context,listen: false).cartProduct[i] );
                                        },
                                        child: Container(
                                            height: 35,
                                            width: 30,
                                            decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(
                                                0xff9ccc90)),
                                            child: Icon(Icons.add)),
                                      ),
                                      const SizedBox(width: 3,),
                                      Text("${Provider.of<ProductProvider>(context).cartProduct[i].quantity}"),
                                      const SizedBox(width: 3,),
                                      InkWell(
                                        onTap: (){
                                          Provider.of<ProductProvider>(context,listen: false).removeProduct(food: Provider.of<ProductProvider>(context,listen: false).cartProduct[i]);
                                        },
                                        child: Container(
                                            height: 35,
                                            width: 30,
                                            decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xff9ccc90)),
                                            child: const Icon(Icons.remove)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
