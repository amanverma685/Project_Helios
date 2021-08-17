import 'package:flutter/material.dart';
import 'package:helios/Models/NavigationItems.dart';
import 'package:helios/Utils/NavigationProvider.dart';
import 'package:provider/provider.dart';

class ListTileSideNavDrawer extends StatelessWidget {
  const ListTileSideNavDrawer(
      {Key? key,
      required this.tileText,
      required this.screenName,
      required this.iconName})
      : super(key: key);

  final String tileText;
  final NavigationItem screenName;
  final Icon iconName;

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

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
            selectItem(context, screenName);
            Navigator.pop(context);
            //
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => screenName,
            //   ),
            // );
          },
          leading: iconName,
        ),
      ),
    );
  }
}
