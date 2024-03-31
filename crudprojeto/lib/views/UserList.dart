import 'package:crudprojeto/Data/DummyUsers.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const user = {...DummyUsers};

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ),
    );
  }
}
