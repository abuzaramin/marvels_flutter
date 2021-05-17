import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvels_flutter/models/person.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {


  static const routeName = '/detail';
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  @override
  Widget build(BuildContext context) {
    final Person person =
    ModalRoute.of(context).settings.arguments as Person;

   // const Key centerKey = ValueKey<String>('bottom-sliver-list');

    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 251.0,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        Container(

                          margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            image: DecorationImage(
                                image: CachedNetworkImageProvider (person.imageURL),
                                fit: BoxFit.scaleDown
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(320, 0, 0, 0),
                          child:  FloatingActionButton(
                            backgroundColor: Colors.pink,
                            onPressed: () async{
                              if (await canLaunch(person.youtubeURL))
                              await launch(person.youtubeURL);
                            },
                            child: Icon(
                              Icons.play_arrow,

                            ),
                          ),
                        ),
                      ],

                  ),


              title: Text(person.name, style:  TextStyle(fontSize: 20, color: Colors.white,  ) , textAlign: TextAlign.left,

              ),
              titlePadding: EdgeInsets.fromLTRB(40, 0, 20, 15),

            ),
          ),
          SliverList(

            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return  Column (
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex : 4,
                            child: Container(
                              //color: Colors.red,
                                width: MediaQuery.of(context).size.width / 2,
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Text(
                                    'Team' ,
                                    textAlign: TextAlign.left,

                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              )
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                                //color: Colors.blue,
                                width: MediaQuery.of(context).size.width / 2,
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                                child: Text(
                                  person.team,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20, color: Colors.grey),
                                )
                            ),
                          ),
                        ]
                      ),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex : 4,
                              child: Container(
                                //color: Colors.red,
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Text(
                                    'IMDB Ratings' ,
                                    textAlign: TextAlign.left,

                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                //color: Colors.blue,
                                  width: MediaQuery.of(context).size.width / 2,
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                                  child: Text(
                                    person.imdb,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20, color: Colors.grey),
                                  )
                              ),
                            ),
                          ]
                      ),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex : 4,
                              child: Container(
                                //color: Colors.red,
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Text(
                                    'Rotten Tomatoes ' ,
                                    textAlign: TextAlign.left,

                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                //color: Colors.blue,
                                  width: MediaQuery.of(context).size.width / 2,
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                                  child: Text(
                                    person.rottenTomatto,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20, color: Colors.grey),
                                  )
                              ),
                            ),
                          ]
                      ),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex : 4,
                              child: Container(
                                //color: Colors.red,
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Text(
                                    'Real Name ' ,
                                    textAlign: TextAlign.left,

                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                //color: Colors.blue,
                                  width: MediaQuery.of(context).size.width / 2,
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                                  child: Text(
                                    person.realName,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20, color: Colors.grey),
                                  )
                              ),
                            ),
                          ]
                      ),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex : 4,
                              child: Container(
                                //color: Colors.red,
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Text(
                                    'First Appearance' ,
                                    textAlign: TextAlign.left,

                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                //color: Colors.blue,
                                  width: MediaQuery.of(context).size.width / 2,
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                                  child: Text(
                                    person.firstAppearance,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20, color: Colors.grey),
                                  )
                              ),
                            ),
                          ]
                      ),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex : 4,
                              child: Container(
                                //color: Colors.red,
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Text(
                                    'Created By' ,
                                    textAlign: TextAlign.left,

                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                //color: Colors.blue,
                                  width: MediaQuery.of(context).size.width / 2,
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                                  child: Text(
                                    person.createdBy,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20, color: Colors.grey),
                                  )
                              ),
                            ),
                          ]
                      ),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex : 4,
                              child: Container(
                                //color: Colors.red,
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Text(
                                    'Publisher' ,
                                    textAlign: TextAlign.left,

                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                //color: Colors.blue,
                                  width: MediaQuery.of(context).size.width / 2,
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                                  child: Text(
                                    person.publisher,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20, color: Colors.grey),
                                  )
                              ),
                            ),
                          ]
                      ),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                //color: Colors.red,
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child:
                                  Html (
                                      data:person.bio,
                                    defaultTextStyle: TextStyle(fontSize: 20, color: Colors.grey),
                                  ),
                              ),
                            ),
                          ]
                      ),
                    ]
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
