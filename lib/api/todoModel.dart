// To parse this JSON data, do
//
//     final todos = todosFromJson(jsonString);

import 'dart:convert';

List<Todos> todosFromJson(String str) => List<Todos>.from(json.decode(str).map((x) => Todos.fromJson(x)));

String todosToJson(List<Todos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todos {
    Todos({
        this.id,
        this.title,
        this.description,
    });

    int id;
    String title;
    String description;

    factory Todos.fromJson(Map<String, dynamic> json) => Todos(
        id: json["id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
    };
}
