import 'package:flutter/material.dart';
import 'package:form_validation_fernando/src/bloc/login_bloc.dart';
export 'package:form_validation_fernando/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  Provider({Key? key, required super.child}) : super(key: key);

  final loginBloc = LoginBloc();

// Vieja forma de mantener el estado del stream sin reiniciarlo a cada rato, necesita revision
///////////////////////////////////////////////////////////////////////
  // static Provider _instancia;

  // factory Provider({ Key key, Widget child }) {

  //   if ( _instancia == null ) {
  //     _instancia = new Provider._internal(key: key, child: child );
  //   }

  //   return _instancia;

  // }

  // Provider._internal({ Key key, Widget child })
  //   : super(key: key, child: child );
////////////////////////////////////////////////////////////////////

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc;
  }
}
