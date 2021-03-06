import 'package:flutter/material.dart';
import 'package:form_validation_fernando/src/bloc/provider.dart';
import 'package:form_validation_fernando/src/pages/home_page.dart';
import 'package:form_validation_fernando/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material app',
        initialRoute: 'login',
        routes: {
          'login': (context) => LoginPage(),
          'home': (context) => HomePage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
