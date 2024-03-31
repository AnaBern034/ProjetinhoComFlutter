import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget{

final Widget child;

  UserProvider(
  {
   required this.child,
  } 
) :super(child: child)

  static UserProvider? of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}