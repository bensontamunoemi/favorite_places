import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:favorite_places/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key});

  void _navigatePlaceScreen(BuildContext context, Place place) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PlaceDetail(
        place: place,
      ),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Places"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddPlaceScreen()));
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: PlaceCard(
          places: places,
          onTabPlace: _navigatePlaceScreen,
        ));
  }
}
