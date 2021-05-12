import 'package:flutter/material.dart';
import 'package:marvels_flutter/widgets/home.dart';
import 'package:marvels_flutter/widgets/detail.dart';
import 'package:marvels_flutter/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn ;
  bool stateSet = false;
  Future<void> isLoggedIn () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUserLoggedIn = prefs.getBool('isLoggedIn') == null ? false : prefs.getBool('isLoggedIn');
    stateSet = true;
    setState(() => {});
  }
  @override
  Widget build(BuildContext context) {

    if (stateSet == false) {
      isLoggedIn();
    }

    if (stateSet) {
      if (isUserLoggedIn) {
        return MaterialApp(

            routes:{
              Detail.routeName: (context) => Detail(),
            },
            title: 'MARVELS',
            theme: ThemeData(
              // primarySwatch: Colors.purple,
              primaryColor: Color.fromRGBO(98, 0, 238, 1),
              accentColor: Color.fromRGBO(55, 0, 179, 1),
            ),
            home: MyHomePage(title: 'Marvels')
        );
      }
      else {
        return MaterialApp(

            routes:{
              Detail.routeName: (context) => Detail(),
            },
            title: 'MARVELS',
            theme: ThemeData(
              // primarySwatch: Colors.purple,
              primaryColor: Color.fromRGBO(98, 0, 238, 1),
              accentColor: Color.fromRGBO(55, 0, 179, 1),
            ),
            home: Login()
        );
      }

    } else {
      return MaterialApp(

          title: 'MARVELS',
          theme: ThemeData(
            // primarySwatch: Colors.purple,
            primaryColor: Color.fromRGBO(98, 0, 238, 1),
            accentColor: Color.fromRGBO(55, 0, 179, 1),
          ),
          home: Scaffold()
      );
    }

    }
}
