import 'package:crudprojeto/Data/DummyUsers.dart';
import 'package:crudprojeto/components/UserTile.dart';
import 'package:crudprojeto/provider/UsersProviders.dart';
import 'package:crudprojeto/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProviders user = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ),
      body: ListView.builder(
          itemCount: user.count,
          itemBuilder: (context, index) => UserTile(user.all.elementAt(index))),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50, // Altura do botão de adicionar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRouts.USER_FORM, arguments: user);
                },
                icon: Icon(Icons.add),
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
