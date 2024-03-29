import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/provider.dart';
import 'package:form_validation/src/pages/home_page.dart';
import 'package:form_validation/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form Validations',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage()
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
        home: Container(
          child: Text("Inicio"),
        ),
      ),
    );
  }
}
