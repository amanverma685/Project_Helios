import 'package:flutter/material.dart';
import 'package:helios/Widgets/Carousel.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';

final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg'
];
final List<String> titles = [' Coffee ', ' Gelato ', ' Ice Cream ', 'Brownie'];

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
        body: SingleChildScrollView(
          // <-- wrap this around
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
            ],
          ),
        ),
      ),
    );
  }
}
