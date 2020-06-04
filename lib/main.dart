import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/authentication_bloc/bloc.dart';
import 'package:new_app/user_repository.dart';
import 'package:new_app/simple_bloc_delegate.dart';
import 'package:new_app/splash_screen.dart';
import 'package:new_app/home_screen.dart';

main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _authenticationBloc,
      child: MaterialApp(
        home: BlocBuilder(
            bloc: _authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is Uninitialized) {
              return SplashScreen();
            }
             if (state is Authenticated){
               return HomeScreen(name: state.displayName);
             }
            }),
      ),
    );
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }
}
