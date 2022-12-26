import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// const Color kPrimaryColor = Color(0xff62FCD7);

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  final Color color;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: buildBorder(color),
        enabledBorder: buildBorder(color),
        focusedBorder: buildBorder(color),
        hintText: hintText,
        hintStyle: TextStyle(
          color: color,
        ),
      ),
      cursorColor: color,
      maxLines: maxLines,
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.sp),
    borderSide: BorderSide(
      color: color ?? Colors.white,
    ),
  );
}
