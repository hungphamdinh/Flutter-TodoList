class Job {
  final int id;
  final String name;
  double textFontSize;
  bool isDone;
  Job({this.id, this.name, this.isDone, this.textFontSize});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone,
      'textFontSize': textFontSize,
    };
  }

  void setIsDone(bool isDone) {
    this.isDone = isDone;
  }

  void setTextFontSize(double textFontSize) {
    this.textFontSize = textFontSize;
  }
}