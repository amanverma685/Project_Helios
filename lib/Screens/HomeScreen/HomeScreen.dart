import 'package:flutter/material.dart';
import 'package:helios/Screens/TodaysDealsScreen/TodaysDeals.dart';
import 'package:helios/Widgets/SideBarDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideBarDrawer(),
        appBar: AppBar(),
        body: Builder(
          builder: (context) {
            if (selectedIndex == 0) {
              return TodaysDeals();
            } else if (selectedIndex == 1) {
              return Center(child: Text("Selected Index is 1"));
            }
            if (selectedIndex == 2) {
              return Center(child: Text("Selected Index is 2"));
            }
            if (selectedIndex == 3) {
              return Center(child: Center(child: Text("Selected Index is 3")));
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
