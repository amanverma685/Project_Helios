import 'package:flutter/material.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';

class YourAccountScreen extends StatefulWidget {
  const YourAccountScreen({Key? key}) : super(key: key);

  @override
  _YourAccountScreenState createState() => _YourAccountScreenState();
}

class _YourAccountScreenState extends State<YourAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideBarDrawer(),
        appBar: AppBar(
          title: Text(
            "My Profile",
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add_shopping_cart),
            )
          ],
        ),
        body: Container(),
      ),
    );
  }
}
