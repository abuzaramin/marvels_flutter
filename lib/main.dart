import 'package:flutter/material.dart';
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
    setState(() => {
        marvels = value
      })
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
          return ListTile(
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

            ),

          );
        },
      )
          : Center(child: const Text('No items')),
    );
  }
}
