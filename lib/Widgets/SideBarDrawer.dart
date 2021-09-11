import 'package:flutter/material.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:helios/Models/NavigationItems.dart';
import 'package:helios/Screens/SplashScreen/Splash_Screen.dart';
import 'package:helios/Utils/Authentication.dart';

import 'ListTileSideBarNavDrawer.dart';

class SideBarDrawer extends StatefulWidget {
  const SideBarDrawer(
      {Key? key,
      required this.photoUrl,
      required this.email,
      required this.name})
      : super(key: key);
  final String photoUrl;
  final String email;
  final String name;

  @override
  _SideBarDrawerState createState() => _SideBarDrawerState();
}

class _SideBarDrawerState extends State<SideBarDrawer> {
  bool _isSigningOut = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.68,
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
                backgroundImage: NetworkImage(widget.photoUrl),
                // NetworkImage(Provider.of<UserDataModel>(context).photoUrl),
                // NetworkImage(_pref.getString('photoUrl')!),
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
                  widget.name,
                  // Provider.of<UserDataModel>(context).name,
                  style: sideBarStyleName,
                ),
                Text(
                  widget.email,
                  // Provider.of<UserDataModel>(context).email,
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
                  screenName: NavigationItem.homeScreen,
                  iconName: Icon(
                    Icons.home_rounded,
                    color: Colors.blue,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Deals For You",
                  screenName: NavigationItem.dealsForYou,
                  iconName: Icon(
                    Icons.tag,
                    color: Colors.blue,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Offers",
                  screenName: NavigationItem.offers,
                  iconName: Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.blue,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Previous Orders",
                  screenName: NavigationItem.previousOrders,
                  iconName: Icon(
                    Icons.delivery_dining,
                    color: Colors.blue,
                  ),
                ),
                ListTileSideNavDrawer(
                  tileText: "Your Account",
                  screenName: NavigationItem.yourAccount,
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
