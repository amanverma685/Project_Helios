import 'package:flutter/material.dart';
import 'package:helios/Models/ThemeModel.dart';
import 'package:helios/Models/UserModal.dart';
import 'package:helios/Screens/SplashScreen/Splash_Screen.dart';
import 'package:helios/Utils/NavigationProvider.dart';
import 'package:provider/provider.dart';

import 'Models/CartModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider<UserDataModel>(
            create: (context) => UserDataModel()),
        ChangeNotifierProvider<AppTheme>(create: (context) => AppTheme()),
        ChangeNotifierProvider<CartModel>(create: (context) => CartModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Helios',
      theme: Provider.of<AppTheme>(context, listen: false).defaultTheme,
      home: MyHomePage(title: 'Helios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   _read();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
