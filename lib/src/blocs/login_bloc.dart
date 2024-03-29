import 'package:async/async.dart';

import 'dart:async';

import 'package:form_validation/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => 
    Observable.combineLatest2(emailStream,passwordStream, (e,p) => true);


  //Insertar valores al email
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener ultimo valor de email y password
  String get lastEmail => _emailController.value;
  String get lastPassword => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
  
}