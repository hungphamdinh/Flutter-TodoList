class Job {
  final int id;
  final String content;
  final String time;
  bool seen;

  Job(this.id, this.content, this.time);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'time': time,
      'seen': seen,
    };
  }
}
