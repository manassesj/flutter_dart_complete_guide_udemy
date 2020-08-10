import 'dart:io';

import 'package:flutter/cupertino.dart';

class PlaceLocationModel {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocationModel(
      {@required this.address, @required this.latitude, this.longitude});
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
