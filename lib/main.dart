// import 'package:elmer_app/routers/user.dart';
import 'package:flutter/material.dart';
import 'package:elmer_app/routers/login.dart';


void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new Login(),
    theme: ThemeData(
        primaryColor: Color(0xFF42A5F5),
        accentColor: Colors.yellow,
        brightness: Brightness.light
    )
  ));
}
