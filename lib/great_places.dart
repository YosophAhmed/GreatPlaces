import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GreatPlaces extends StatelessWidget {
  const GreatPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          // home: HomePage(),
        );
      },
    );
  }
}
