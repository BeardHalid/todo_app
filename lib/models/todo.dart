class Todo{
  final String id;
  final String text;
  String checked;

  Todo({required this.id, required this.text, required this.checked});

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(id: json['id'] as String, text: json['text'] as String, checked: json['checked'] as String);
  }
}