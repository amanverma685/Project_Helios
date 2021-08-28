import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:helios/Screens/CategoryItemScreen/CategoryItemScreen.dart';
import 'package:helios/Widgets/BestsellerGridViewWidget.dart';
import 'package:helios/Widgets/Carousel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/homePage';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void setIsLoggedIn(dataToSet) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('userIsLoggedIn', dataToSet);
  }

  @override
  void initState() {
    setIsLoggedIn(true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: SliderCarouselWithDots(
                  imageList: imagesList,
                  titles: titles,
                ),
              ),
              //TODO
              // Expansiontile(), Tile To add Address

              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontFamily: 'IndieFlower',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryItemScreen('all', ''),
                            ),
                          );
                        },
                        child: Text("View More"))
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * .26,
                  width: double.infinity,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4.0,
                    children: List.generate(categoryCardImages.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItemScreen(
                                  itemCategoryName[index],
                                  categoryCardImages[index]),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 9,
                                child: Card(
                                  elevation: 4,
                                  shadowColor: Colors.black,
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
                                flex: 2,
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange)
                      ],
                    ),
                  ],
                ),
              ),

              BestSellerGridViewWidget(), //BestSellar Category Grid View
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.deepPurple,
                child: Center(
                  child: Text(
                    "Helios",
                    style: TextStyle(color: Colors.white, fontSize: 30),
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
