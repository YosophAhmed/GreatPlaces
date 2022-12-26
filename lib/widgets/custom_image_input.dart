import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomImageInput extends StatefulWidget {
  const CustomImageInput({Key? key}) : super(key: key);

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  File? storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 25.h,
          width: 25.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(
              color: Colors.indigo,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: storedImage != null
              ? Image.file(
                  storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          width: 2.w,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            children: const [
              Text(
                'Take Image ',
              ),
              Icon(
                Icons.camera,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
