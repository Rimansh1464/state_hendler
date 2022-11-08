import 'package:flutter/material.dart';
import 'package:food_app/helper/db_helper.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/utils/cololrs.dart';
import 'package:food_app/view/home_screens.dart';
import 'package:provider/provider.dart';

import '../modals/food_models.dart';
import 'details_screen.dart';

class like_screen extends StatefulWidget {
  const like_screen({Key? key}) : super(key: key);

  @override
  State<like_screen> createState() => _like_screenState();
}


class _like_screenState extends State<like_screen> {

  Future<List<Foods>?> AddData() async {
  Provider.of<ProductProvider>(context,listen: false).likefetchdata();
  //print("$dbFood");
}
  @override
  void initState() {
    super.initState();
    AddData();
  }

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
                onTap: () {

                },
                child: Text(
                  "Your like",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future:Provider.of<ProductProvider>(context,listen: false).dbLike,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List<Foods>? allLike = snapshot.data;
                    return (allLike!.isEmpty)? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: Text("No Data..."),),
                      ],
                    ):Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 0.10,
                        children: List.generate(
                          allLike!.length,
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              onTap: () {

                                                setState(() {
                                                  DBhelper.dBhelper.update(
                                                      name: allLike[i].foodName,
                                                      like: 'false');
                                                  print("like===${allLike[i].like}");
                                                });
                                                Provider.of<ProductProvider>(context,listen: false).fetchdata();

                                                //Provider.of<ProductProvider>(context,listen: false).islike(name: allLike[i]);
                                                Provider.of<ProductProvider>(context,listen: false).likefetchdata();



                                              },
                                              child: Icon(Icons.favorite)),
                                          SizedBox(
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
                                                      "${allLike[i].image}")))),
                                      Text(
                                        "${allLike[i].foodName}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "20 min",
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            "4.5",
                                            style:
                                            TextStyle(color: Colors.grey),
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
                                                  productList: allLike[i]);
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
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(
                                                          20),
                                                      bottomRight:
                                                      Radius.circular(
                                                          20)),
                                                  color: primary),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
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
      ),
    );
  }
}
