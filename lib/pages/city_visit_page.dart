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
            ..._getCitiVisitTodosList(cityVisit.todos),
          ],
        ),
      ),
      floatingActionButton: AddElementButton(
        "Add City Visit",
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
}
