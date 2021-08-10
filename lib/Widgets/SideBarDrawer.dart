import 'package:flutter/material.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:helios/Screens/HomeScreen/HomeScreen.dart';
import 'package:helios/Screens/OffersScreen/OffersScreen.dart';
import 'package:helios/Screens/PreviousOrders/PreviousOrdersScreen.dart';
import 'package:helios/Screens/TodaysDealsScreen/TodaysDeals.dart';
import 'package:helios/Screens/YourAccountScreen/YourAccountScreen.dart';

import 'ListTileSideBarNavDrawer.dart';

class SideBarDrawer extends StatelessWidget {
  // SideBarDrawer(this.urlImage, this.name, this.email);
  final String urlImage =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

  final String name = "Sarah Abs";
  final String email = "sarah@abs.com";
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
              flex: 2,
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
                ListTileSideNavDrawer(
                  tileText: "Log Out",
                  screenName: YourAccountScreen(),
                  iconName: Icon(
                    Icons.logout,
                    color: Colors.blue,
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
