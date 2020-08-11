import 'dart:io';

import 'package:flutter/cupertino.dart';

class PlaceLocationModel {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocationModel(
      {this.address, @required this.latitude, @required this.longitude});
}

class PlaceModel {
  final String id;
  final String title;
  final PlaceLocationModel location;
  final File image;

  PlaceModel({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
