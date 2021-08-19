import 'package:flutter/material.dart';
import 'package:helios/Models/NavigationItems.dart';
import 'package:helios/Screens/CartScreen/CartScreen.dart';
import 'package:helios/Screens/HomeScreen/HomeScreen.dart';
import 'package:helios/Screens/OffersScreen/OffersScreen.dart';
import 'package:helios/Screens/PreviousOrders/PreviousOrdersScreen.dart';
import 'package:helios/Screens/TodaysDealsScreen/TodaysDeals.dart';
import 'package:helios/Screens/YourAccountScreen/YourAccountScreen.dart';
import 'package:helios/Utils/NavigationProvider.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isSigningOut = false;
  String name = "";
  String email = "";
  String photoUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMDoZqGk6An-DWrwWp2AQ1a2aug6xZ_IQSQWMO-1Cj1p0mwr2lPHLNWGbQknO-671N5es&usqp=CAU";
  initialiseSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')!;
    name = prefs.getString('name')!;
    photoUrl = prefs.getString('photoUrl')!;
    setState(() {});
  }

  @override
  void initState() {
    initialiseSharePreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          drawer: SideBarDrawer(
            email: email,
            name: name,
            photoUrl: photoUrl,
          ),
          appBar: AppBar(
            title: Text(
              "Helios",
              style: TextStyle(fontFamily: "Lobster", fontSize: 35),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          body: buildPages(),
        ),
      );

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;
    switch (navigationItem) {
      case NavigationItem.homeScreen:
        return HomeScreen();
      case NavigationItem.dealsForYou:
        return TodaysDeals();
      case NavigationItem.offers:
        return OffersScreen();
      case NavigationItem.previousOrders:
        return PreviousOrdersScreen();
      case NavigationItem.yourAccount:
        return YourAccountScreen();
    }
  }
}
