import 'package:crudprojeto/provider/UsersProviders.dart';
import 'package:crudprojeto/routes/AppRoutes.dart';
import 'package:crudprojeto/views/UserForm.dart';
import 'package:crudprojeto/views/UserList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsersProviders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: {
          AppRouts.HOME: (_) =>
              UserList(), // -> rota home classe contadora e rotalist(usuarios adicionados)
          AppRouts.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
