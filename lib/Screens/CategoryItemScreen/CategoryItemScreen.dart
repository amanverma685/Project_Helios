import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Shows the data of selected category products

class CategoryItemScreen extends StatelessWidget {
  final String itemCategoryName;
  final String categoryCardImage;

  const CategoryItemScreen(this.itemCategoryName, this.categoryCardImage)
      : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {}, child: Icon(Icons.add_shopping_cart_rounded)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(itemCategoryName),
              Container(
                height: 300,
                width: 200,
                child: Center(
                  child: Hero(
                    tag: itemCategoryName,
                    child: CachedNetworkImage(
                      imageUrl: categoryCardImage,
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
