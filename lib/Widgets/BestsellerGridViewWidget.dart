import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:helios/Models/Get-All-Bestseller-Model.dart';
import 'package:helios/Screens/CategoryItemScreen/CategoryItemScreen.dart';
import 'package:helios/Screens/ProductScreen/ProductScreen.dart';

class BestSellerGridViewWidget extends StatefulWidget {
  const BestSellerGridViewWidget({Key? key}) : super(key: key);

  @override
  _BestSellerGridViewWidgetState createState() =>
      _BestSellerGridViewWidgetState();
}

class _BestSellerGridViewWidgetState extends State<BestSellerGridViewWidget> {
  var bestSellerProducts;
  int modHud = 0;
  fetchAllBestsellers() async {
    modHud = 1;
    bestSellerProducts = await fetchAllBestsellerProducts();
    print(bestSellerProducts);
    modHud = 0;
    setState(() {});
  }

  @override
  void initState() {
    fetchAllBestsellers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: modHud == 1
          ? SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int modHud) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                  ),
                );
              },
            )
          : Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8.0,
                  children: List.generate(
                      bestSellerProducts['responseData'].length, (index) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Colors.lightBlueAccent, spreadRadius: 3)
                              // ],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 10,
                                child: Card(
                                  elevation: 7,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blueGrey, width: 1),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25.0),
                                    ),
                                    child: Hero(
                                      tag: bestSellerProducts['responseData']
                                          [index]['productId'],
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            bestSellerProducts['responseData']
                                                [index]['imageUrl'],
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 5,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          bestSellerProducts['responseData']
                                              [index]['title'],
                                          softWrap: true,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: IconButton(
                                      color: Colors.black,
                                      icon: Icon(Icons.add_shopping_cart),
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
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                              bestSellerProducts['responseData'][index],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
    );
  }
}
