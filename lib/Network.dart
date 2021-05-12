import 'dart:convert';
import 'person.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<List<Person>> fetchAlbum() async {
    final response = await http.get(Uri.http('s3.us-east-1.amazonaws.com', '/marvels-android/marvels.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable iterable = jsonDecode(response.body);
      return List <Person>.from(iterable.map((e) => Person.fromJson(e)));

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}