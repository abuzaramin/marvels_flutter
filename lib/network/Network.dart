import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:marvels_flutter/models/person.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<List<Person>> fetchAlbum() async {
    try {
      final response = await http.get(Uri.http('s3.us-east-1.amazonaws.com', '/marvels-android/marvels.json')).timeout(Duration(seconds: 10) , onTimeout: () {
        return null;
      });

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Iterable iterable = jsonDecode(response.body);
        return List <Person>.from(iterable.map((e) => Person.fromJson(e)));

      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    }on TimeoutException catch (e) {
      return null;
    } on SocketException catch (e) {
      return null;
    } on Error catch (e) {
      return null;
    }

  }
}