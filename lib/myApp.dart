import 'package:flutter/material.dart';
import 'package:marvels_flutter/home.dart';
import 'package:marvels_flutter/detail.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: MyHomePage(title: 'Marvels'),
    );
  }
}