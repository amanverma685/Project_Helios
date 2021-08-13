import 'package:flutter/material.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:helios/Models/UserModal.dart';
import 'package:helios/Screens/HomeScreen/HomeScreen.dart';
import 'package:helios/Screens/OffersScreen/OffersScreen.dart';
import 'package:helios/Screens/PreviousOrders/PreviousOrdersScreen.dart';
import 'package:helios/Screens/SplashScreen/Splash_Screen.dart';
import 'package:helios/Screens/TodaysDealsScreen/TodaysDeals.dart';
import 'package:helios/Screens/YourAccountScreen/YourAccountScreen.dart';
import 'package:helios/Utils/Authentication.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ListTileSideBarNavDrawer.dart';

class SideBarDrawer extends StatefulWidget {
  // SideBarDrawer(this.urlImage, this.name, this.email);
  @override
  _SideBarDrawerState createState() => _SideBarDrawerState();
}

class _SideBarDrawerState extends State<SideBarDrawer> {
  // final String urlImage =
  //     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
  //
  bool _isSigningOut = false;
  //
  // final String name = "Sarah Abs";
  //
  // final String email = "sarah@abs.com";
  void initialiseSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initialiseSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(Provider.of<UserDataModel>(context).photoUrl),
                // NetworkImage(prefs.getString('photoUrl')!),
                maxRadius: 60,
                minRadius: 40,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  Provider.of<UserDataModel>(context).name,
                  style: sideBarStyleName,
                ),
                Text(
                  Provider.of<UserDataModel>(context).email,
                  style: sideBarStyleEmail,
                ),
              ],
            ),
          ),
          Divider(
            endIndent: 20,
            color: Colors.blue,
            indent: 20,
            thickness: 2,
          ),
          Expanded(
            flex: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTileSideNavDrawer(
                  tileText: "Home",
                  screenName: TodaysDeals(),
                  iconName: Icon(
                    Icons.home_rounded,
                    color: Colors.blue,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Deals For You",
                  screenName: TodaysDeals(),
                  iconName: Icon(
                    Icons.tag,
                    color: Colors.blue,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Offers",
                  screenName: OffersScreen(),
                  iconName: Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.blue,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Previous Orders",
                  screenName: PreviousOrdersScreen(),
                  iconName: Icon(
                    Icons.delivery_dining,
                    color: Colors.blue,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Your Account",
                  screenName: YourAccountScreen(),
                  iconName: Icon(
                    Icons.account_box_outlined,
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Material(
                    child: ListTile(
                      title: Text(
                        "Log Out",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () async {
                        Navigator.pop(context);
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SplashScreen(),
                          ),
                        );
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
