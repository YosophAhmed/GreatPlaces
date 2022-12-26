import 'package:flutter/material.dart';
import 'package:great_places/widgets/custom_button.dart';
import 'package:great_places/widgets/custom_image_input.dart';
import 'package:great_places/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class AddPlaceScreen extends StatefulWidget {
  static const String routeName = 'AddPlaceScreen';

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add a new place',
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
                      hintText: 'Title',
                      controller: titleController,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const CustomImageInput(),
                  ],
                ),
              ),
            ),
          ),
          CustomButton(
            label: 'Add Place',
            color: Colors.amberAccent,
            height: 60,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
