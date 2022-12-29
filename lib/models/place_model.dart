import 'dart:io';

import 'package:great_places/models/place_location_model.dart';

class Place {
  final String id;
  final String title;
  // final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    // required this.location,
    required this.image,
  });
}

