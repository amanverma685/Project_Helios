import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helios/Models/Get-All-Bestseller-Model.dart';
import 'package:helios/Screens/ProductScreen/ProductScreen.dart';

import 'CachedNetworkImageWidget.dart';

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
          ? Flexible(
              child: Container(
                height: 150,
                color: Colors.red,
                child: SpinKitWave(
                  itemBuilder: (BuildContext context, int modHud) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.lightBlueAccent,
                      ),
                    );
                  },
                ),
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.65,
                      scrollDirection: Axis.vertical,
                      crossAxisSpacing: 10.0,
                      children: List.generate(
                          bestSellerProducts['responseData'].length, (index) {
                        return GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: Offset(
                                        4, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Hero(
                                        tag: bestSellerProducts['responseData']
                                            [index]['productId'],
                                        child: Container(
                                          height: 120,
                                          width: 190,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: CachedNetworkImageProvider(
                                                      bestSellerProducts[
                                                              'responseData']
                                                          [index]['imageUrl'])),
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     color: Colors.black,
                                              //     spreadRadius: 2,
                                              //     blurRadius: 10,
                                              //     offset: Offset(4,
                                              //         3), // changes position of shadow
                                              //   ),
                                              // ],
                                              color: Colors.white,
                                              shape: BoxShape.rectangle),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        bestSellerProducts['responseData']
                                            [index]['title'],
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "Rs.50/-",
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
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
                  ),
                ),
              ],
            ),
    );
  }
}
//
// Container(
// height: 300,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.all(Radius.circular(30)),
// boxShadow: [
// BoxShadow(
// color: Colors.black,
// spreadRadius: 2,
// blurRadius: 8,
// offset: Offset(4, 3), // changes position of shadow
// ),
// ],
// ),
// width: MediaQuery.of(context).size.width * 0.5,
// child: Column(
// children: [
// Expanded(
// flex: 2,
// child: Padding(
// padding: EdgeInsets.all(15.0),
// child: Container(
// height: 120,
// width: 190,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.all(Radius.circular(20)),
// image: DecorationImage(
// fit: BoxFit.cover,
// image: CachedNetworkImageProvider(
// "https://images.unsplash.com/photo-1534596292079-6ab51b3b0507?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHdhdGVyJTIwYm90dGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
// ),
// boxShadow: [
// BoxShadow(
// color: Colors.black,
// spreadRadius: 2,
// blurRadius: 10,
// offset: Offset(
// 4, 3), // changes position of shadow
// ),
// ],
// color: Colors.red,
// shape: BoxShape.rectangle),
// ),
// ),
// ),
// SizedBox(
// height: 10,
// ),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// "Helios Mint Flavoured Detox",
// maxLines: 3,
// style: TextStyle(
// fontSize: 20, fontWeight: FontWeight.bold),
// ),
// ),
// ),
// Expanded(
// child: Container(
// child: Text(
// "Rs.50/-",
// maxLines: 2,
// style: TextStyle(fontSize: 20),
// ),
// ),
// )
// ],
// ),
// )
//
//
//
//

//Container(
//                           height: 500,
//                           color: Colors.red,
//                           child: Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Expanded(
//                                   flex: 10,
//                                   child: Card(
//                                     elevation: 7,
//                                     shadowColor: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                       side: BorderSide(
//                                           color: Colors.blueGrey, width: 1),
//                                       borderRadius: BorderRadius.circular(30.0),
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(25.0),
//                                       ),
//                                       child: Hero(
//                                           tag:
//                                               bestSellerProducts['responseData']
//                                                   [index]['productId'],
//                                           child: CachedNetworkImageWidget(
//                                             imageUrlString: bestSellerProducts[
//                                                     'responseData'][index]
//                                                 ['imageUrl'],
//                                           )
//
//                                           // CachedNetworkImage(
//                                           //   imageUrl:
//                                           //       bestSellerProducts['responseData']
//                                           //           [index]['imageUrl'],
//                                           //   placeholder: (context, url) => Center(
//                                           //     child: CircularProgressIndicator(
//                                           //       strokeWidth: 5,
//                                           //     ),
//                                           //   ),
//                                           //   errorWidget: (context, url, error) =>
//                                           //       Icon(Icons.error),
//                                           //   fit: BoxFit.cover,
//                                           //   width: double.infinity,
//                                           // ),
//                                           ),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 2,
//                                   child: Row(
//                                     // mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     textBaseline: TextBaseline.ideographic,
//                                     children: [
//                                       Expanded(
//                                         flex: 3,
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 10.0),
//                                           child: Text(
//                                             bestSellerProducts['responseData']
//                                                 [index]['title'],
//                                             softWrap: true,
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 14),
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: IconButton(
//                                           color: Colors.black,
//                                           icon: Icon(Icons.add_shopping_cart),
//                                           onPressed: () {
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               const SnackBar(
//                                                 backgroundColor:
//                                                     Colors.lightBlueAccent,
//                                                 duration:
//                                                     Duration(milliseconds: 50),
//                                                 content: Text(
//                                                   'Adding your Item to Cart',
//                                                   style: TextStyle(
//                                                       color: Colors.black),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
