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
                  maxRadius: 100,
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
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Text("Aman"),
                    onTap: () {},
                    leading: Icon(Icons.home),
                  ),
                  ListTile(
                    title: Text("Aman"),
                    onTap: () {},
                    leading: Icon(Icons.home),
                    tileColor: Colors.orange,
                  ),
                  ListTile(
                    title: Text("Aman"),
                    onTap: () {},
                    leading: Icon(Icons.home),
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
