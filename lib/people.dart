import 'package:flutter/cupertino.dart';


class People {

   String name = '';
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

   People (this.name, this.realName, this.team, this.firstAppearance, this.createdBy, this.publisher, this.imageURL, this.bio, this.imdb,
       this.rottenTomatto, this.youtubeURL);

   People.fromJson(Map<String, dynamic> json) : name = json['name'],
          realName = json ['realname'], team = json['team'], firstAppearance = json['firstappearance'], createdBy = json['createdby'],
          publisher = json['publisher'], imageURL = json['imageurl'], bio = json['bio'] , imdb = json['IMDB'] ,
          rottenTomatto = json['rottenTomatoes'], youtubeURL = json['youtubeURL'];
}