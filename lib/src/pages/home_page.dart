import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/login_bloc.dart';
import 'package:form_validation/src/blocs/provider.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LoginBloc bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Email: ${bloc.lastEmail}'),
              Text('Password: ${bloc.lastPassword}'),
            ],
          ),
      ),
    );
  }
}