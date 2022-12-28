import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class CustomImageInput extends StatefulWidget {
  final void Function(File) onSelectImage;

  const CustomImageInput({
    Key? key,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  File? storedImage;

  Future<void> takeImage() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile != null) {
      setState(() {
        storedImage = File(imageFile.path);
      });
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);
      final savedImage = await imageFile.saveTo('${appDir.path}/$fileName');
      widget.onSelectImage(storedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 25.h,
          width: 25.h,
          decoration: BoxDecoration(
            borderRadius: storedImage == null
                ? BorderRadius.circular(8.sp)
                : BorderRadius.circular(0),
            border: Border.all(
              color: Colors.indigo,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: storedImage != null
              ? Image.file(
                  storedImage!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                )
              : const Text(
                  'No Image Taken',
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          width: 2.w,
        ),
        ElevatedButton(
          onPressed: takeImage,
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
