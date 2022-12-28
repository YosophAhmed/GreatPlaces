import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place_model.dart';

class Places with ChangeNotifier {
  List<Place> items = [];

  List<Place> get getItems {
    return [...items];
  }

  void addPlace({
    required String title,
    required File image,
  }) {
    final newPlace = Place(
      id: DateTime.now().toString().substring(0, 11),
      title: title,
      image: image,
    );
    items.add(newPlace);
    notifyListeners();
  }
}
