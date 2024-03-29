import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/login_bloc.dart';
import 'package:form_validation/src/blocs/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _crearFondo(context),
            _loginForm(context),
          ],
        ),
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0)
        ]),
      ),
    );

    final circulo = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(
          child: circulo,
          top: 90.0,
          left: 30.0,
        ),
        Positioned(
          child: circulo,
          top: -40.0,
          right: -30.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          right: -10.0,
        ),
        Positioned(
          child: circulo,
          bottom: 120.0,
          right: 20.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          left: -20.0,
        ),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 80.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text("Manuel Toro Rivas",
                  style: TextStyle(color: Colors.white, fontSize: 20.0))
            ],
          ),
        ),
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final loginBloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 160,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 40.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0),
                ]),
            child: Column(
              children: <Widget>[
                Text("Ingreso", style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 60.0,
                ),
                _crearEmail(loginBloc),
                SizedBox(
                  height: 30.0,
                ),
                _crearPassword(loginBloc),
                SizedBox(
                  height: 30.0,
                ),
                _crearBoton(loginBloc),
              ],
            ),
          ),
          Text("¿Olvidó la contaseña?"),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurple,
              ),
              hintText: "ejemplo@gmail.com",
              labelText: "Correo electrónico",
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Colors.deepPurple,
              ),
              labelText: "Contraseña",
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text("Ingresar"),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: !snapshot.hasData ? null : () => _login(bloc, context),
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context){
    print('========================== :');
    print('Email : ${bloc.lastEmail}');
    print('Password ${bloc.lastPassword}:');
    print('========================== :');
    Navigator.pushReplacementNamed(context, 'home');
  }
}
