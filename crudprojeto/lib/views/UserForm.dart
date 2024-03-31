import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de usuario'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _form.currentState?.save();
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.save),
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Curso/periodo'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'UrlDoAvatar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
