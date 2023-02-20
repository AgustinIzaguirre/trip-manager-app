import 'package:flutter/material.dart';
import '../models/city_visit.dart';
import '../widgets/add_elemen_button.dart';
import '../widgets/empty_list_widget.dart';

class CityVisitPage extends StatelessWidget {
  final CityVisit cityVisit;
  const CityVisitPage(this.cityVisit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(cityVisit.name),
      ),
      body: Center(
        child: Column(
          children: [
            _getMeansOfTransportWidget(cityVisit.arrivalDate, true),
            _getMeansOfTransportWidget(cityVisit.departureDate, false),
            ..._getCitiVisitTodosList(cityVisit.todos),
          ],
        ),
      ),
      floatingActionButton: AddElementButton(
        "Add Todo",
        () {},
      ),
    );
  }

  List<Widget> _getCitiVisitTodosList(List<String> citiesVisitTodos) {
    if (citiesVisitTodos.isEmpty) {
      return [
        const EmptyListWidget("No todos yet!"),
      ];
    }
    return citiesVisitTodos.map((citiesVisitTodo) => Text("Todo")).toList();
  }

  Widget _getMeansOfTransportWidget(DateTime transportTime, bool isArrival) {
    final Color borderColor = isArrival
        ? Color.fromARGB(255, 166, 249, 169)
        : Color.fromARGB(255, 251, 172, 166);
    final String dateFormatted =
        '${transportTime.day}/${transportTime.month}/${transportTime.year} - ${transportTime.hour}:${transportTime.minute}';
    return Card(
      color: borderColor,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
              child: Icon(
                Icons.flight,
                size: 40,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
              child: Text(
                dateFormatted,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Column(
              children: [
                Text(
                  "Buenos Aires",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_downward_rounded),
                Text(
                  "Madrid",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
