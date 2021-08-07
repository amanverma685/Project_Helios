import 'package:flutter/material.dart';

class SideBarDrawer extends StatelessWidget {
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
            flex: 1,
            child: Center(
              child: CircleAvatar(
                foregroundImage: AssetImage("assets/images/profile.jpg"),
                maxRadius: 60,
                minRadius: 40,
              ),
            ),
          ),
          Divider(
            endIndent: 20,
            color: Colors.blue,
            indent: 20,
            thickness: 2,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Text(
                    "Today's Deals",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                  leading: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Offers",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                  leading: Icon(
                    Icons.ac_unit_rounded,
                    color: Colors.teal,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Previous Orders",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                  leading: Icon(
                    Icons.delivery_dining,
                    color: Colors.teal,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Your Account",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                  leading: Icon(
                    Icons.account_box_outlined,
                    color: Colors.teal,
                  ),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.white,
                ),
                ListTile(
                  title: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                  leading: Icon(
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
