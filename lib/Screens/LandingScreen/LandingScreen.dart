import 'package:flutter/material.dart';
import 'package:helios/Models/NavigationItems.dart';
import 'package:helios/Models/UserModal.dart';
import 'package:helios/Screens/HomeScreen/HomeScreen.dart';
import 'package:helios/Screens/OffersScreen/OffersScreen.dart';
import 'package:helios/Screens/PreviousOrders/PreviousOrdersScreen.dart';
import 'package:helios/Screens/TodaysDealsScreen/TodaysDeals.dart';
import 'package:helios/Screens/YourAccountScreen/YourAccountScreen.dart';
import 'package:helios/Utils/NavigationProvider.dart';
import 'package:helios/Widgets/LocationModalBottomSheet.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isSigningOut = false;
  String name = "";
  String email = "";
  var defaultLocation;
  String photoUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMDoZqGk6An-DWrwWp2AQ1a2aug6xZ_IQSQWMO-1Cj1p0mwr2lPHLNWGbQknO-671N5es&usqp=CAU";
  initialiseSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')!;
    defaultLocation = prefs.getString('defaultLocation');
    currentLocation = defaultLocation != null
        ? defaultLocation
        : "Please add any default Location";
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

  void addLocation(defaultLocation) {
    currentLocation = defaultLocation;
    setState(() {});
  }

  Color backColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) => Container(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: backColor,
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
                      color: backColor,
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(20),
                      //   bottomRight: Radius.circular(20),
                      // ),
                    ),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              scaffoldKey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.view_headline_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
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
                  Container(
                    color: backColor,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.where_to_vote_rounded,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            flex: 12,
                            child: Text(
                              "$currentLocation",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 2,
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
                                    return LocationModalBottomSheet(
                                        addLocation: addLocation);
                                  },
                                );
                              },
                              icon: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.add_circle_outline_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
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
