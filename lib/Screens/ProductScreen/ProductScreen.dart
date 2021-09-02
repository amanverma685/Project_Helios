import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Shows the data of selected category products

class ProductScreen extends StatefulWidget {
  final productDetails;

  const ProductScreen(
    this.productDetails,
  ) : super();

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Helios",
            style: TextStyle(fontFamily: "Lobster", fontSize: 35),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add_shopping_cart),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.productDetails['title']),
              Container(
                height: 300,
                width: 200,
                child: Center(
                  child: Hero(
                    tag: widget.productDetails['productId'],
                    child: CachedNetworkImage(
                      imageUrl: widget.productDetails['imageUrl'],
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
