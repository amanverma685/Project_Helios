import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:helios/Constants/Products.dart';
import 'package:helios/Screens/CategoryItemScreen/CategoryItemScreen.dart';
import 'package:helios/Screens/OffersScreen/OffersScreen.dart';
import 'package:helios/Widgets/Carousel.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/homePage';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideBarDrawer(),
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
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.306,
                  width: double.infinity,
                  child: SliderCarouselWithDots(
                    imageList: imagesList,
                    titles: titles,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontFamily: 'IndieFlower',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: () {}, child: Text("View More"))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 4.0,
                    children: List.generate(categoryCardImages.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryItemScreen(
                                    itemCategoryName[index],
                                    categoryCardImages[index])),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25.0),
                                    ),
                                    child: Hero(
                                      tag: itemCategoryName[index],
                                      child: CachedNetworkImage(
                                        imageUrl: categoryCardImages[index],
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
                                flex: 1,
                                child: Text(
                                  itemCategoryName[index],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bestseller Products",
                        style: TextStyle(
                            fontFamily: 'IndieFlower',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star, color: Colors.orange)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //BestSellar Category Grid View
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 4.0,
                        children:
                            List.generate(categoryCardImages.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryItemScreen(
                                        bestSellerProductNames[index],
                                        bestsellerProductsImages[index])),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25.0),
                                        ),
                                        child: Hero(
                                          tag: bestSellerProductNames[index],
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                bestsellerProductsImages[index],
                                            placeholder: (context, url) =>
                                                Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 5,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      bestSellerProductNames[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.deepPurple,
                    child: Center(
                      child: Text(
                        "Helios",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
