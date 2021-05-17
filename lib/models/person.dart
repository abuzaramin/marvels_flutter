import 'package:flutter/cupertino.dart';


class Person {

   int id;
   String name ;
   String realName;
   String team;
   String firstAppearance;
   String createdBy;
   String publisher;
   String imageURL;
   String bio;
   String imdb;
   String rottenTomatto;
   String youtubeURL;

   static const String TABLENAME = "Person";

   Person (this.id, this.name, this.realName, this.team, this.firstAppearance, this.createdBy, this.publisher, this.imageURL, this.bio, this.imdb,
       this.rottenTomatto, this.youtubeURL);

   Person.fromJson(Map<String, dynamic> json) : id = json['id'], name = json['name'],
          realName = json ['realname'], team = json['team'], firstAppearance = json['firstappearance'], createdBy = json['createdby'],
          publisher = json['publisher'], imageURL = json['imageurl'], bio = json['bio'] , imdb = json['IMDB'] ,
          rottenTomatto = json['rottenTomatoes'], youtubeURL = json['youtubeURL'];

   Person.fromDBJson(Map<String, dynamic> json) : id = json['id'], name = json['name'],
          realName = json ['realname'], team = json['team'], firstAppearance = json['firstAppearance'], createdBy = json['createdBy'],
          publisher = json['publisher'], imageURL = json['imageURL'], bio = json['bio'] , imdb = json['imdb'] ,
          rottenTomatto = json['rottenTomatto'], youtubeURL = json['youtubeURL'];

   Map<String, dynamic> toMap() {
      return {'id': id, 'name': name, 'realname': realName, 'team': team, 'firstAppearance': firstAppearance, 'createdBy': createdBy, 'publisher':publisher,
         'imageURL': imageURL, 'bio': bio, 'imdb': imdb , 'rottenTomatto': rottenTomatto, 'youtubeURL' : youtubeURL };
   }

   Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
      "realname": realName,
      "team": team,
      "firstAppearance": firstAppearance,
      "createdBy": createdBy,
      "publisher": publisher,
      "imageURL": imageURL,
      "bio": bio,
      "imdb": imdb,
      "rottenTomatto": rottenTomatto,
      "youtubeURL": youtubeURL
   };
}