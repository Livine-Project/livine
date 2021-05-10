import 'dart:convert';
import 'package:flutter/material.dart';
import './todoModel.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class Services {
  static final url = Uri.http("localhost:8000", "/category");

 static Future<List<Todos>> getTodos() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Todos> todos = todosFromJson(response.body);
        return todos;
      } else {
        return List<Todos>();
      }
    } catch (e) {
      return List<Todos>();
    }
  }
}
