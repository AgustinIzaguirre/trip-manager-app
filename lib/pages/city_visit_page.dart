import 'package:flutter/material.dart';
import 'package:trip_manager/models/todo.dart';
import 'package:trip_manager/widgets/means_of_transport_widget.dart';
import 'package:trip_manager/widgets/todo_list_item_widget.dart';
import '../models/city_visit.dart';
import '../widgets/add_elemen_button.dart';
import '../widgets/empty_list_widget.dart';

class CityVisitPage extends StatefulWidget {
  final CityVisit cityVisit;
  final Function deleteCityVisit;

  const CityVisitPage(this.cityVisit, this.deleteCityVisit, {super.key});

  @override
  State<CityVisitPage> createState() => _CityVisitPageState();
}

class _CityVisitPageState extends State<CityVisitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.cityVisit.name),
        actions: [
          IconButton(
            onPressed: () {
              widget.deleteCityVisit(widget.cityVisit);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            MeansOfTransportWidget(widget.cityVisit.arrivalTransport, true),
            MeansOfTransportWidget(widget.cityVisit.departureTransport, false),
            ..._getCitiVisitTodosList(widget.cityVisit.todos),
          ],
        ),
      ),
      floatingActionButton: AddElementButton(
        "Add Todo",
        () {},
      ),
    );
  }

  List<Widget> _getCitiVisitTodosList(List<Todo> citiesVisitTodos) {
    if (citiesVisitTodos.isEmpty) {
      return [
        const EmptyListWidget("No todos yet!"),
      ];
    }
    return citiesVisitTodos
        .map((citiesVisitTodo) => TodoListItemWidget(
              citiesVisitTodo,
              _updateTodoStatus,
              _removeTodo,
            ))
        .toList();
  }

  void _updateTodoStatus(final Todo todo, final bool isDone) {
    var todoToUpdate = widget.cityVisit.todos
        .where((element) => element.description == todo.description);
    if (todoToUpdate.length > 0) {
      setState(() {
        todoToUpdate.first.updateStatus(isDone);
      });
    }
  }

  void _removeTodo(final Todo todo) {
    setState(() {
      widget.cityVisit.todos.remove(todo);
    });
  }
}
