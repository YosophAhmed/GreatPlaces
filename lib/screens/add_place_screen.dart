import 'package:flutter/material.dart';
import 'package:great_places/widgets/custom_button.dart';
import 'package:great_places/widgets/custom_image_input.dart';
import 'package:great_places/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

import '../providers/places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const String routeName = 'AddPlaceScreen';

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();

  File? _pickedImage;

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void savePlace() {
    if (titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<Places>(
      context,
      listen: false,
    ).addPlace(
      title: titleController.text,
      image: _pickedImage!,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          'Add a new place',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 36,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Place Name',
                      controller: titleController,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomImageInput(
                      onSelectImage: selectImage,
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomButton(
            label: 'Add Place',
            color: Colors.indigo,
            height: 60,
            onTap: savePlace,
          ),
        ],
      ),
    );
  }
}
