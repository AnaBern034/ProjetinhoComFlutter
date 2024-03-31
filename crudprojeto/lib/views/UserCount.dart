import 'package:crudprojeto/provider/UsersProviders.dart';
import 'package:crudprojeto/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProviders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Número de Usuários'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Total de usuários: ${usersProvider.count}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre os widgets
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouts.LIST_USERS);
              },
              child: Text('Ver Lista de Usuários'),
            ),
            SizedBox(
                height: 20), // Espaçamento entre os widgets e o final da tela
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50, // Altura do botão
          child: ElevatedButton(
            onPressed: () {
              // Ação do segundo botão
            },
            child: Text('Outra Ação'),
          ),
        ),
      ),
    );
  }
}
