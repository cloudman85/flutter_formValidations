


import 'dart:async';

class Validators {

  final validarEmail  = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regexp = new RegExp(pattern);
      if(regexp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError("Email incorrecto");
      }

    }
  );


  final validarPassword  = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >=6){
        sink.add(password);
      }else{
        sink.addError("El mínimo son 6 caracteres");
      }
    }
  );
}