import 'package:flutter/material.dart';
import '../models/trip.dart';
import 'package:trip_manager/pages/trip_visit_page.dart';

class TripListItem extends StatelessWidget {
  final Trip trip;
  const TripListItem(this.trip, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToTripPage(context, trip),
      child: Card(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(trip.name)],
          ),
        ),
      ),
    );
  }

  void goToTripPage(BuildContext context, Trip trip) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TripPage(trip)));
  }
}
