import 'package:flutter/material.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideBarDrawer(),
        appBar: AppBar(
          title: Text(
            "Offers only for you",
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
