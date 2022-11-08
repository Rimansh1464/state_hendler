import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/utils/cololrs.dart';

import '../helper/db_helper.dart';
import '../modals/food_models.dart';
import '../utils/list.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  foodinit() async {
    // String json = await rootBundle.loadString("asserts/json/quotes.json");
    // List<Food> FoodList = foodFromJson(json);
    DBhelper.dBhelper.insertData(foodlist: FoodList);

  }
  // foodinit() async {
  //   for (Foods product in FoodList) {
  //     await DBhelper.dBhelper.insertData(data: FoodList);
  //
  //   }
  //
  // }
  @override
   void initState() {
    super.initState();
    foodinit();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(height: 150,),
            Center(
              child: Image.asset(
                "asserts/images/foodDish.png",
                scale: 1.7,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Fast delivery at \n your doorstep ",
              style: TextStyle(
                  fontSize: 23, color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Home delivery and online reservation\n     system for restaurants & cafe ",
              style: TextStyle(fontSize: 15, color: Colors.white70),
            ),
            SizedBox(height: 100,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context,"Navigation");
              },
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                child: Center(
                  child: Text(
                    "Let's Explore",
                    style: TextStyle(color: primary,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
