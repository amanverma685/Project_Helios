import 'package:flutter/material.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';

class PreviousOrdersScreen extends StatefulWidget {
  const PreviousOrdersScreen({Key? key}) : super(key: key);

  @override
  _PreviousOrdersScreenState createState() => _PreviousOrdersScreenState();
}

class _PreviousOrdersScreenState extends State<PreviousOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideBarDrawer(),
        appBar: AppBar(
          title: Text("Orders"),
          actions: [
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
