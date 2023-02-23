class Todo {
  final String description;
  bool isDone;

  Todo._(this.description, this.isDone);

  static Todo of(final String description, final bool isDone) {
    return Todo._(description, isDone);
  }

  void updateStatus(bool isDone) {
    this.isDone = isDone;
  }
}
