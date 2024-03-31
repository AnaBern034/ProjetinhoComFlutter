import 'package:flutter/material.dart';

class User {
  final int? id;
  final String name;
  final String cursoPeriodo;

  const User({
    this.id,
    required this.name,
    required this.cursoPeriodo,
  });
}
