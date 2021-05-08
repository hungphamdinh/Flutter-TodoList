class Message {
  int id;
  String content;
  String time;
  bool seen = false;

  Message({this.id, this.content, this.time});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    time = json['time'];
    seen = json['seen'];
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'time': time,
      'seen': seen,
    };
  }
}
