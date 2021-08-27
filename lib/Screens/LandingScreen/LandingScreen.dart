import 'package:flutter/material.dart';
import 'package:helios/Models/NavigationItems.dart';
import 'package:helios/Models/UserModal.dart';
import 'package:helios/Screens/HomeScreen/HomeScreen.dart';
import 'package:helios/Screens/OffersScreen/OffersScreen.dart';
import 'package:helios/Screens/PreviousOrders/PreviousOrdersScreen.dart';
import 'package:helios/Screens/TodaysDealsScreen/TodaysDeals.dart';
import 'package:helios/Screens/YourAccountScreen/YourAccountScreen.dart';
import 'package:helios/Utils/NavigationProvider.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';
import 'package:location/location.dart';
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

  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isDrawerOpen = false;

  @override
  void initState() {
    initialiseSharePreference();
    super.initState();
  }

  Location location = new Location();

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.transparent,
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            drawer: SideBarDrawer(
              email: email,
              name: name,
              photoUrl: photoUrl,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(height: 10),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              icon: Icon(Icons.view_headline_outlined),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    contentPadding: EdgeInsets.all(10),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.search),
                                      color: Colors.black,
                                      onPressed: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Type in your text",
                                    fillColor: Colors.white70),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        YourAccountScreen(),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    Provider.of<UserDataModel>(context)
                                        .photoUrl),
                                maxRadius: 60,
                                minRadius: 40,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                  ),
                  buildPages(),
                ],
              ),
            ),
          ),
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
