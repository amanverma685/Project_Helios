import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:helios/Constants/Constants.dart';

import 'CachedNetworkImageWidget.dart';

class PreviousOrderItemsSideScrollWidget extends StatelessWidget {
  const PreviousOrderItemsSideScrollWidget(List<dynamic> previousOrdersList,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Previous Orders",
                    style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: previousOrdersList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: .6,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 6,
                      shadowColor: Colors.blue,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CachedNetworkImageWidget(
                                  imageUrlString:
                                      "https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-FrozenGarden.png?w=525",
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Helios Mineral Water",
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Mint Flavour",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "1 Litre",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "4/5",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Rs.60/-",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.add_shopping_cart,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor:
                                                    Colors.lightBlueAccent,
                                                duration:
                                                    Duration(milliseconds: 50),
                                                content: Text(
                                                  'Adding your Item to Cart',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
