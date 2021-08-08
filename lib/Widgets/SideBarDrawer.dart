import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:helios/Screens/HomeScreen/HomeScreen.dart';
import 'package:helios/Screens/OffersScreen/OffersScreen.dart';
import 'package:helios/Screens/PreviousOrders/PreviousOrdersScreen.dart';
import 'package:helios/Screens/TodaysDealsScreen/TodaysDeals.dart';
import 'package:helios/Screens/YourAccountScreen/YourAccountScreen.dart';

class SideBarDrawer extends StatelessWidget {
  final urlImage =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
  final name = 'Sarah Abs';
  final email = 'sarah@abs.com';
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
                backgroundImage: NetworkImage(urlImage),
                // foregroundImage: AssetImage("assets/images/profile.jpg"),
                maxRadius: 60,
                minRadius: 40,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    name,
                    style: sideBarStyleName,
                  ),
                  Text(
                    email,
                    style: sideBarStyleEmail,
                  )
                ],
              )),
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
                  screenName: HomeScreen(),
                  iconName: Icon(
                    Icons.home_rounded,
                    color: Colors.teal,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Deals For You",
                  screenName: TodaysDeals(),
                  iconName: Icon(
                    Icons.tag,
                    color: Colors.teal,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Offers",
                  screenName: OffersScreen(),
                  iconName: Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.teal,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Previous Orders",
                  screenName: PreviousOrdersScreen(),
                  iconName: Icon(
                    Icons.delivery_dining,
                    color: Colors.teal,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Your Account",
                  screenName: YourAccountScreen(),
                  iconName: Icon(
                    Icons.account_box_outlined,
                    color: Colors.teal,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Log Out",
                  screenName: YourAccountScreen(),
                  iconName: Icon(
                    Icons.logout,
                    color: Colors.teal,
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

class ListTileSideNavDrawer extends StatelessWidget {
  const ListTileSideNavDrawer({
    Key? key,
    required this.tileText,
    required this.screenName,
    required this.iconName,
  }) : super(key: key);

  final String tileText;
  final Widget screenName;
  final Icon iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Material(
        child: ListTile(
          title: Text(
            tileText,
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => screenName,
              ),
            );
          },
          leading: iconName,
        ),
      ),
    );
  }
}
