import 'package:flutter/material.dart';
import 'package:great_places/providers/places.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class GreatPlaces extends StatelessWidget {
  const GreatPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: const PlacesListScreen(),
          );
        },
      ),
    );
  }
}
