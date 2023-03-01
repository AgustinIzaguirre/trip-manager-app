import 'package:flutter/material.dart';
import 'package:trip_manager/models/city_visit.dart';
import 'package:flag/flag.dart';
import 'package:trip_manager/pages/city_visit_page.dart';

class CityVisitListItem extends StatelessWidget {
  final CityVisit cityVisit;
  final Function deleteCityVisit;

  const CityVisitListItem(this.cityVisit, this.deleteCityVisit, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToCityVisitPage(context, cityVisit),
      child: Card(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                child: Flag.fromCode(
                  cityVisit.country.flagsCode,
                  width: 40,
                  height: 40,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                child: Text(
                  cityVisit.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                child: Text(
                  '${cityVisit.daysOfVisit} days',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToCityVisitPage(BuildContext context, CityVisit cityVisit) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CityVisitPage(cityVisit, deleteCityVisit)));
  }
}
