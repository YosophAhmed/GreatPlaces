import 'package:flutter/material.dart';
import 'package:great_places/widgets/custom_elevated_button.dart';
import 'package:sizer/sizer.dart';
import 'package:location/location.dart';

class CustomLocationInput extends StatefulWidget {
  const CustomLocationInput({Key? key}) : super(key: key);

  @override
  State<CustomLocationInput> createState() => _CustomLocationInputState();
}

class _CustomLocationInputState extends State<CustomLocationInput> {
  String? previewImageUrl;

  Future<void> getCurrentLocation() async {
    final locationData = await Location().getLocation();
    debugPrint(locationData.longitude.toString());
    debugPrint(locationData.latitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: previewImageUrl == null
                ? BorderRadius.circular(8.0.sp)
                : BorderRadius.circular(0),
            border: Border.all(
              color: Colors.indigo,
              width: 1.0,
            ),
          ),
          child: previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.indigo,
                  ),
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  previewImageUrl!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomElevatedButton(
              onPressed: getCurrentLocation,
              text: 'Current Location',
              icon: Icons.location_on,
            ),
            CustomElevatedButton(
              onPressed: () {},
              text: 'Select Location',
              icon: Icons.map,
            ),
          ],
        ),
      ],
    );
  }
}
