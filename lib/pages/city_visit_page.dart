import 'package:flutter/material.dart';
import 'package:trip_manager/models/means_of_transport.dart';
import 'package:trip_manager/models/transport_type.dart';
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
            _getMeansOfTransportWidget(cityVisit.arrivalTransport, true),
            _getMeansOfTransportWidget(cityVisit.departureTransport, false),
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

  Widget _getMeansOfTransportWidget(
      MeansOfTransport meansOfTransport, bool isArrival) {
    final IconData transportIcon = meansOfTransport.type == TransportType.plane
        ? Icons.flight
        : Icons.train;
    final Color borderColor = isArrival
        ? Color.fromARGB(255, 166, 249, 169)
        : Color.fromARGB(255, 251, 172, 166);
    final DateTime transportTime = meansOfTransport.time;
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
                transportIcon,
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
                  meansOfTransport.from,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_downward_rounded),
                Text(
                  meansOfTransport.to,
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
