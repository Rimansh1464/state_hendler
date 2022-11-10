import 'package:flutter/material.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/utils/cololrs.dart';
import 'package:food_app/view/home_screens.dart';
import 'package:provider/provider.dart';

import '../utils/list.dart';

class DetailsScreens extends StatefulWidget {
   DetailsScreens({Key? key,required this.id}) : super(key: key);
  int id;
  @override
  State<DetailsScreens> createState() => _DetailsScreensState();
}

class _DetailsScreensState extends State<DetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: SizedBox(
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 533,
                      color: primary,
                    ),
                    Positioned(
                        top: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white24),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Text(
                              "Food Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            InkWell(
                              onTap: (){

                                Provider.of<ProductProvider>(
                                    context,
                                    listen: false)
                                    .likeProduct(likeList: FoodList[widget.id], i: widget.id);
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white24),
                                child:  Center(
                                  child:Icon(Icons.favorite,color: Colors.white,)

                                ),
                              ),
                            ),
                          ],
                        )), //Container
                    Positioned(
                      top: 270,
                      child: Container(
                        height: 534,
                        width: 360,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${FoodList[widget.id].foodName}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Foods",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: primary,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 55,
                                    width: 105,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: primary),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        children:  [
                                          InkWell(
                                            onTap:(){
                                              Provider.of<ProductProvider>(context,listen: false).addproduct(productList:Provider.of<ProductProvider>(context,listen: false).cartProduct[widget.id.toInt()] );
                                            },
                                            child: Text("+", style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),
                                          ),
                                          Text("1", style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),),
                                          InkWell(
                                            onTap: (){
                                              Provider.of<ProductProvider>(context,listen: false).removeProduct(food: Provider.of<ProductProvider>(context,listen: false).cartProduct[widget.id]);
                                            },
                                            child: Text("-", style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star, color: Colors.yellow,),
                                    Text("4.5", style: TextStyle(
                                        color: Colors.grey, fontSize: 16),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.water_drop, color: Colors.red,),
                                    Text("100 Kacal", style: TextStyle(
                                        color: Colors.grey, fontSize: 16),),
                                  ],
                                ),Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later, color: Colors.yellow,),
                                    Text("4.5", style: TextStyle(
                                        color: Colors.grey, fontSize: 16),),
                                  ],
                                ),

                              ],),
                              const SizedBox(height: 30,),

                              Text("About food",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                              SizedBox(height: 10,),
                              Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. ",style: TextStyle(fontSize: 13,color: Colors.grey)),
                              SizedBox(height: 30,),
                              InkWell(
                                onTap: (){
                                  Provider.of<ProductProvider>(
                                      context,
                                      listen: false)
                                      .addproduct(
                                      productList: FoodList[widget.id]);

                                },
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: primary),
                                  child: const Center(
                                    child: Text(
                                      "Add to card",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), //Container
                    Positioned(
                      left: 70,
                      top: 150,
                      child: Container(
                        height: 220,
                        width: 220,
                        child: Image.asset("${FoodList[widget.id].image}"),

                      ),
                    ),
                    //Container
                  ], //<Widget>[]
                ), //Center
              ), //SizedBox
            )));
  }
}
