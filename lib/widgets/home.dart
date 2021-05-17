import 'package:flutter/material.dart';
import 'package:marvels_flutter/database/DatabaseHelper.dart';
import 'package:marvels_flutter/network/Network.dart';
import 'package:marvels_flutter/models/person.dart';
import 'package:marvels_flutter/widgets/login.dart';
import 'package:marvels_flutter/widgets/detail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> entries = <String>['A', 'B', 'C'];
  List<Person> marvels ;
  Network network;


  @override
  void initState () {
    super.initState();
    DatabaseHelper.instance.getPersons().then((insertedPerson) => {
    setState(() => {
    marvels = insertedPerson
      })
    });

    network = Network();
    fetchData();
  }

  void fetchData () {
    network.fetchAlbum().then((value) => {

      if (value != null) {
        DatabaseHelper.instance.insertPersons(value).then((value) =>
        {
          fetchFromDb(),
        }),
      }
      else {
        fetchFromDb(),
        showToast(),
      }
    });
  }
  void showToast() {

    Fluttertoast.showToast(
        msg: "Something went wrong, kindly check your internet connection and try again",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void fetchFromDb () {
    DatabaseHelper.instance.getPersons().then((insertedPerson) =>
    {
      setState(() =>
      {
        marvels = insertedPerson
      })
    });
  }
  @override
  Widget build(BuildContext maincontext) {

    return Scaffold(
      appBar: AppBar(title: const Text('Marvels'),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: () {
              setState(() {
                marvels = null;
              });
              fetchData();
            }),
         IconButton(icon: Icon(Icons.logout), onPressed: () {
           logOutUser();
           Navigator
               .of(context)
               .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Login() ));
         }),

        ],
      ),
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
                      image: CachedNetworkImageProvider (marvels[index].imageURL),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              title: Text(marvels[index].name),
              subtitle: Text(marvels[index].team),
              trailing: IconButton(

                onPressed: () async{
                  if (await canLaunch(marvels[index].youtubeURL))
                    await launch(marvels[index].youtubeURL);
                },
                icon: Icon(Icons.play_arrow),
                color: Colors.pink,
                iconSize: 40,
              ),
              onTap: () {
                Person person = marvels[index];
                Navigator.pushNamed (
                    context,
                    Detail.routeName, arguments: person
                );
              },
            ),
          );
        },
      )
          : Container(
        alignment: Alignment.center,
          child: CircularProgressIndicator(

      )) ,
    );

  }

  void logOutUser () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }
}