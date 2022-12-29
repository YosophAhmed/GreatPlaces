import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/helpers/db_helper.dart';

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
    DBHelper.insert(
      table: 'user_places',
      data: {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
  }

  Future<void> fetchPlace() async {
    final dataList = await DBHelper.getData(
      'user_places',
    );
    items = dataList
        .map(
          (element) => Place(
            title: element['title'],
            image: File(element['image']),
            id: element['id'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
