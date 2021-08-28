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
import 'package:helios/Widgets/UserAddressList.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// e6:3d:e3:96:55:ef:bc:9e:88:d6:c5:24:03:c2:be:aa:99:f9:57:04:58:28:03:5f:a8:26:ea:90:38:94:6d:98
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

  var currentLocation = " Please enter your delivery Location......";

  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isDrawerOpen = false;

  @override
  void initState() {
    initialiseSharePreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
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
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              scaffoldKey.currentState!.openDrawer();
                            },
                            icon: Icon(Icons.view_headline_outlined),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
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
                                  hintStyle: TextStyle(color: Colors.grey[800]),
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
                                  Provider.of<UserDataModel>(context).photoUrl),
                              maxRadius: 60,
                              minRadius: 40,
                            ),
                          ),
                        ),
                        SizedBox(width: 10)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0), //Please Enter your loc.. padding
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Icon(
                            Icons.where_to_vote_rounded,
                            color: Colors.cyan,
                          )),
                          Expanded(
                            flex: 10,
                            child: Text(
                              "$currentLocation",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                          height: 300, child: Expansiontile()),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.add_circle_outline_outlined),
                            ),
                          ),
                          Expanded(
                            child: Text(""),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: buildPages(),
                  ),
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
