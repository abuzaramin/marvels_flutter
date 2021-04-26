import 'package:flutter/material.dart';
import 'package:marvels_flutter/DatabaseHelper.dart';
import 'package:marvels_flutter/Network.dart';
import 'package:marvels_flutter/people.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: MyHomePage(title: 'Marvels'),
    );
  }
}

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
  Widget build(BuildContext context) {
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

              leading: CircleAvatar(
                child: FadeInImage.assetNetwork(
                  image:marvels[index].imageURL,
                  placeholder: 'assets/profile.png',
                ),

              ),
              title: Text(marvels[index].name),
              subtitle: Text(marvels[index].team),
              trailing: IconButton(
                onPressed: () {  },
                icon: Icon(Icons.play_arrow),
                color: Colors.pink,
              ),

            ),
          );
        },
      )
          : Center(child: const Text('No items')),
    );
  }
}
