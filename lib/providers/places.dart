import 'package:flutter/foundation.dart';

import '../models/place_model.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [...items];
  }
}
