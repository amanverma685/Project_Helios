import 'package:flutter/material.dart';

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
