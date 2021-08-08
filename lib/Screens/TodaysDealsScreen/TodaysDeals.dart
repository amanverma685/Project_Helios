import 'package:flutter/material.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';

class TodaysDeals extends StatefulWidget {
  const TodaysDeals({Key? key}) : super(key: key);
  static const String routeName = '/todaysDeals';

  @override
  _TodaysDealsState createState() => _TodaysDealsState();
}

class _TodaysDealsState extends State<TodaysDeals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideBarDrawer(),
        appBar: AppBar(
          title: Text("Deals For You"),
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
