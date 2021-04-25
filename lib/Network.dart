import 'dart:convert';
import 'people.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<List<People>> fetchAlbum() async {
    final response = await http.get(Uri.http('s3.us-east-1.amazonaws.com', '/marvels-android/marvels.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable iterable = jsonDecode(response.body);
      return List <People>.from(iterable.map((e) => People.fromJson(e)));

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}