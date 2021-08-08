import 'package:flutter/material.dart';
import 'package:helios/Screens/TodaysDealsScreen/TodaysDeals.dart';
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
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add_shopping_cart),
              )
            ],
          ),
          body: Container()),
    );
  }
}
