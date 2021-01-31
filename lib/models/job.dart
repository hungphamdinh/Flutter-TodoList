class Job {
  final int id;
  final String name;
  final bool isDone;
  Job({this.id, this.name, this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone,
    };
  }
}