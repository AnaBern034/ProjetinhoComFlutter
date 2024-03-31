import 'package:crudprojeto/models/User.dart';
import 'package:crudprojeto/routes/AppRoutes.dart';
import 'package:flutter/material.dart';

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
                  Navigator.of(context)
                      .pushNamed(AppRouts.USER_FORM, arguments: user);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 143, 26, 163),
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 185, 27, 16),
                ))
          ]),
        ));
  }
}
