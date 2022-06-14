import 'package:flutter/material.dart';
import 'package:form_validation_fernando/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 30.0),
                _crearEmail(context, bloc),
                const SizedBox(height: 30.0),
                _crearPassword(context, bloc),
                const SizedBox(height: 30.0),
                _crearBoton(context, bloc),
              ],
            ),
          ),
          const Text('Olvido su contra?'),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _crearEmail(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: const Icon(Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'Kaedeakamatsu@gmail.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                icon: const Icon(Icons.password_outlined,
                    color: Colors.deepPurple),
                labelText: 'Contrase;a',
                counterText: snapshot.data,
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
              ),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }

  Widget _crearBoton(BuildContext context, LoginBloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromRGBO(90, 70, 178, 1.0),
            ),
            elevation: MaterialStateProperty.all(0.0),
          ),
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text(
              'Ingresar',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('//////////////////');
    print('Email:${bloc.email} ');
    print('Password:${bloc.password} ');
    print('//////////////////');
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ],
        ),
      ),
    );
    final _circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
    return Stack(
      children: [
        _fondoMorado,
        Positioned(
          top: 90.0,
          left: 30.0,
          child: _circulo,
        ),
        Positioned(
          top: -40.0,
          right: -30.0,
          child: _circulo,
        ),
        Positioned(
          top: -50.0,
          right: -10.0,
          child: _circulo,
        ),
        Positioned(
          top: 120.0,
          right: 20.0,
          child: _circulo,
        ),
        Positioned(
          top: -50.0,
          left: -20.0,
          child: _circulo,
        ),
        Container(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(children: const [
            Icon(
              Icons.person_pin_circle,
              color: Colors.white,
              size: 100.0,
            ),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            Text(
              'Kaede Akamatsu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
