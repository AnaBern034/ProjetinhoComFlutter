import 'package:crudprojeto/models/User.dart';
import 'package:crudprojeto/provider/UsersProviders.dart';
import 'package:crudprojeto/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl!.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl!));

    return ListTile(
        leading: avatar,
        title: Text(user.name ?? 'Name not available'),
        subtitle: Text(user.cursoPeriodo ?? 'Name not available'),
        trailing: Container(
          width: 100,
          child: Row(children: <Widget>[
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Excluir Usuário'),
                            content: Text('Tem certeza?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Não')),
                              TextButton(
                                  onPressed: () {
                                    Provider.of<UsersProviders>(context,
                                            listen: false)
                                        .remove(user);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Sim'))
                            ],
                          ));
                },
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 185, 27, 16),
                ))
          ]),
        ));
  }
}
