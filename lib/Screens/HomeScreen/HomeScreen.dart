import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.orange,
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
                    title: Text("Today's Deals"),
                    onTap: () {},
                    leading: Icon(Icons.home),
                  ),
                  ListTile(
                    title: Text("Offers"),
                    onTap: () {},
                    leading: Icon(Icons.ac_unit_rounded),
                  ),
                  ListTile(
                    title: Text("Previous Orders"),
                    onTap: () {},
                    leading: Icon(Icons.snippet_folder),
                  ),
                  ListTile(
                    title: Text("Aman"),
                    onTap: () {},
                    leading: Icon(Icons.home),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(),
    ));
  }
}
