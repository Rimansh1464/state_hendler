import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/helper/db_helper.dart';
import 'package:food_app/utils/cololrs.dart';
import 'package:food_app/view/product_like.dart';
import 'package:provider/provider.dart';

import '../modals/food_models.dart';
import '../provider/product_provider.dart';
import 'details_screen.dart';

// Future<List<Foods>>? dbFood;
// Future<List<Foods>>? dbLike;
List<bool> starList = List.generate(20, (index) => false);

bool isLike = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  AddData() {
    Provider.of<ProductProvider>(context, listen: false).fetchdata();
    //print("$dbFood");
  }

  String onChang = "";

  void initState() {
    super.initState();

    AddData();
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: primary,
                      size: 25,
                    ),
                    Text(
                      " Magura,BD",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => like_screen(),
                        ));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Hi Rinku",
              style: TextStyle(
                  fontSize: 20, color: primary, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Find Your food",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xffecf8e9),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<ProductProvider>(context,listen: false).dbFood =
                          DBhelper.dBhelper.searchCategory(name: onChang);
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search"),
                    controller: textEditingController,
                    onChanged: (val) {
                      print(val);
                      onChang = val;
                      print(onChang);
setState(() {
  Provider.of<ProductProvider>(context, listen: false)
      .dbFood =
      DBhelper.dBhelper.searchCategory(name: onChang);
});

                    },
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<ProductProvider>(context).fetchdata();

                    onChang = "";
                    textEditingController.clear();
                  },
                  child: Text(
                    "Food",
                    style: TextStyle(color: primary, fontSize: 18),
                  ),
                ),
                const Text(
                  "Fruits",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const Text(
                  "Vegetables",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const Text(
                  "Grocery",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: Provider.of<ProductProvider>(context).dbFood,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<Foods>? allfood = snapshot.data;
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 0.10,
                      children: List.generate(
                        allfood!.length,
                        (i) => SingleChildScrollView(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreens(
                                      id: i,
                                    ),
                                  ));
                            },
                            child: Container(
                              height: 222,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[300]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              starList[i] = !starList[i];

                                              DBhelper.dBhelper.update(
                                                  name: allfood[i].foodName,
                                                  like: starList[i].toString());
                                            });
                                            Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .likeProduct(likeList: allfood[i], i: i);
                                          },
                                          child: (allfood[i].like == "true")
                                              ? Icon(Icons.favorite)
                                              : Icon(Icons.favorite_border),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                    Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "${allfood[i].image}")))),
                                    Text(
                                      "${allfood[i].foodName}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "20 min",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "4.5",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "     15.00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .addproduct(
                                                    productList: allfood[i]);

                                          },
                                          child: Container(
                                            height: 38,
                                            width: 38,
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20)),
                                                color: primary),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
