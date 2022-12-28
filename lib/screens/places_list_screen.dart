import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';

class PlacesListScreen extends StatelessWidget {
  static const String routeName = 'PlacesListScreen';

  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Great Places',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddPlaceScreen.routeName,
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Consumer<Places>(
        builder: (context, provider, child) {
          if (provider.items.isEmpty) {
            return child!;
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  provider.items[index].title,
                ),
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    provider.items[index].image,
                  ),
                ),
                onTap: (){},
              ),
              itemCount: provider.items.length,
            );
          }
        },
        child: const Center(
          child: Text(
            'No Places yet, Start adding some places!',
          ),
        ),
      ),
    );
  }
}
