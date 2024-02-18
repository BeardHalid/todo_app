class Todo{
  final int id;
  final String text;
  String checked;

  Todo({required this.id, required this.text, required this.checked});

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(id: json['id'] as int, text: json['text'] as String, checked: json['checked'] as String);
  }
}