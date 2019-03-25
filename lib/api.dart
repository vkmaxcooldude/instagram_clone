import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart';

//API URL: http://www.tankmates.org/fetchFeed.php

/*
void main(){
  //ContentDetails().loadContent();
}
*/
ContentDetails testElements; //variable where JSON details are stored as PODO
int counter = 0;

class ImageDetails{
  int id;
  String description;
  String imgURL;
  String mediaType;
  String postedOn;
  double latitude;
  double longitude;
  UserDetails userDetails;

  ImageDetails({
    this.id,
    this.description,
    this.imgURL,
    this.mediaType,
    this.postedOn,
    this.latitude,
    this.longitude,
    this.userDetails,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> parsedJson){
    return ImageDetails(
        id: int.tryParse(parsedJson['id']),
        description: parsedJson['description'],
        imgURL: parsedJson['medialink'],
        mediaType: parsedJson['mediatype'],
        postedOn: parsedJson['postedon'],
        latitude: double.tryParse(parsedJson['latitude']),
        longitude: double.tryParse(parsedJson['longitude']),
        userDetails: UserDetails.fromJson(parsedJson['poster'])
    );
  }
}

class UserDetails{
  String fullName;
  String userImage;

  UserDetails({
    this.fullName,
    this.userImage,
  });

  factory UserDetails.fromJson(Map<String, dynamic> parsedJson){
    return UserDetails(
      fullName: parsedJson['fullname'],
      userImage: parsedJson['userimage'],
    );
  }
}

class ContentDetails{


  bool error;
  bool success;
  final List<ImageDetails> data;

  ContentDetails({
    this.error,
    this.success,
    this.data
  });

  factory ContentDetails.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
    List<ImageDetails> imagesList = list.map((i) => ImageDetails.fromJson(i)).toList();
    return ContentDetails(
      error: parsedJson['error'] == "" ? false : true,
      success: parsedJson['success'],
      data: imagesList,
    );
  }

  fetchPost() async {
    final result = await get('http://www.tankmates.org/fetchFeed.php');
    if (result.statusCode == 200) {
      return result.body;
    }
    else throw Exception("Could not load the file!");
  }

  Future loadContent() async {
    String jsonString = await fetchPost();
    final jsonResponse = json.decode(jsonString);
    ContentDetails contentDetails = new ContentDetails.fromJson(jsonResponse);
    testElements = contentDetails;
    //print(contentDetails.success);
    //print(contentDetails.data[0].latitude);
    //print(contentDetails.data[0].longitude);
    //print(contentDetails.data[30].userDetails.fullName);
    //The above four lines are to print the output on the terminal screen.
  }

}