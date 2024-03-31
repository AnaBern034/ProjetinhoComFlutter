import 'package:crudprojeto/models/User.dart';
import 'package:crudprojeto/provider/UsersProviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, String>();

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id!;
      _formData['name'] = user.name!;
      _formData['cursoPeriodo'] = user.cursoPeriodo!;
      _formData['avatarUrl'] = user.avatarUrl!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de usuario'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();
                Provider.of<UsersProviders>(context, listen: false).put(User(
                    id: _formData['id'],
                    name: _formData['name'],
                    cursoPeriodo: _formData['cursoPeriodo'],
                    avatarUrl: _formData['avatarUrl']));
                Navigator.of(context).pop();
              }
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
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome completo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O nome não pode estar vazio';
                  }

                  if (value.trim().length < 10) {
                    return 'O nome está muito pequeno';
                  }
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['cursoPeriodo'],
                decoration: InputDecoration(labelText: 'Curso/periodo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O curso não pode estar vazio';
                  }

                  if (value.trim().length < 3) {
                    return 'O nome do curso está muito pequeno';
                  }
                },
                onSaved: (value) => _formData['cursoPeriodo'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'UrlDoAvatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
