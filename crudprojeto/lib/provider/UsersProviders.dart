import 'dart:math';

import 'package:crudprojeto/Data/DummyUsers.dart';
import 'package:crudprojeto/models/User.dart';
import 'package:flutter/material.dart';

class UsersProviders with ChangeNotifier {
  final Map<String, User> _itens = {...DummyUsers};

  List<User> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  User byIdex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null && _itens.containsKey(user.id)) {
      _itens.update(
          user.id as String,
          (_) => User(
              name: user.name,
              cursoPeriodo: user.cursoPeriodo,
              avatarUrl: user.avatarUrl));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          '1',
          () => User(
              id: id,
              name: user.name,
              cursoPeriodo: user.cursoPeriodo,
              avatarUrl: user.avatarUrl));
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _itens.remove(user.id);
      notifyListeners();
    }
  }
}