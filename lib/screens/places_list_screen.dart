import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/places.dart';

class PlacesListScreen extends StatelessWidget {
  static const String routeName = 'PlacesListScreen';

  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Great Places',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(
          context,
          listen: false,
        ).fetchPlace(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<Places>(
                    builder: (context, provider, child) {
                      if (provider.items.isEmpty) {
                        return child!;
                      } else {
                        return ListView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 25.h,
                                  width: 25.h,
                                  child: Image.file(
                                    provider.items[index].image,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Expanded(
                                  child: Text(
                                    provider.items[index].title,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemCount: provider.items.length,
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        'No Places yet, Start adding some places!',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(
            context,
            AddPlaceScreen.routeName,
          );
        },
        elevation: 0.0,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}