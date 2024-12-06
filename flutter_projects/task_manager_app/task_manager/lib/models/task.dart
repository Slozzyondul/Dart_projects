class Task {
  String content;
  DateTime timestamp;
  bool done;

  Task({
    required this.content,
    required this.timestamp,
    required this.done,
  });

  factory Task.fromMap(Map task) {
    return Task(
      content: task["content"],
      timestamp: DateTime.parse(task["timestamp"]),
      done: task["done"],
    );
  }

  Map toMap() {
    return {
      "content": content, 
      "timestamp": timestamp.toIso8601String(),
      "done": done,
    };
  }
}
