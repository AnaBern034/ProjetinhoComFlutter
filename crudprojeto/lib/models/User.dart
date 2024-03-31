import 'package:flutter/material.dart';

class User {
  final String? id;
  final String name;
  final String cursoPeriodo;
  final String? avatarUrl;

  const User({
    this.id,
    required this.name,
    required this.cursoPeriodo,
    this.avatarUrl,
  });
}
