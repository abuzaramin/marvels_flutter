import 'package:flutter/material.dart';
import 'package:marvels_flutter/DatabaseHelper.dart';
import 'package:marvels_flutter/Network.dart';
import 'package:marvels_flutter/people.dart';
import 'package:marvels_flutter/detail.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> entries = <String>['A', 'B', 'C'];
  List<People> marvels ;
  Network network;

  @override
  void initState () {
    super.initState();
    network = Network();
    network.fetchAlbum().then((value) => {

      DatabaseHelper.instance.insertPeoples(value).then((value) => {
        DatabaseHelper.instance.getPeoples().then((insertedPeople) => {
          setState(() => {
            marvels = insertedPeople
          })
        })
      }),
    });
  }

  @override
  Widget build(BuildContext maincontext) {
    return Scaffold(
      appBar: AppBar(title: const Text('Marvels')),
      body: marvels != null
          ? ListView.builder(
        itemCount: marvels.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(

              leading:
              Container(
                //margin: EdgeInsets.fromLTRB(0, 30, 0, 60),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(marvels[index].imageURL),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              title: Text(marvels[index].name),
              subtitle: Text(marvels[index].team),
              trailing: IconButton(
                onPressed: () {  },
                icon: Icon(Icons.play_arrow),
                color: Colors.pink,
              ),
              onTap: () {
                People people = marvels[index];
                Navigator.pushNamed (
                    context,
                    Detail.routeName, arguments: people
                );
              },
            ),
          );
        },
      )
          : Center(child: const Text('No items')),
    );
  }
}