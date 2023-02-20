
import 'package:flutter/material.dart';
import 'package:trip_manager/widgets/city_visit_list_item_widget.dart';
import '../models/city_visit.dart';
import '../widgets/add_elemen_button.dart';
import '../widgets/empty_list_widget.dart';
import '../models/trip.dart';

class TripPage extends StatelessWidget {
  final Trip trip;
  const TripPage(this.trip, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(trip.name),
      ),
      body: Center(
        child: ListView(
          children: _getCitiVisitList(trip.cities),
        ),
      ),
      floatingActionButton: AddElementButton(
        "Add City Visit",
        () {},
      ),
    );
  }

  List<Widget> _getCitiVisitList(List<CityVisit> citiesVisit) {
    if (citiesVisit.isEmpty) {
      return [
        const EmptyListWidget("No city visits yet!"),
      ];
    }
    return citiesVisit
        .map((cityVisit) => CityVisitListItem(cityVisit))
        .toList();
  }
}
