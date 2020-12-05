import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/register/bloc/Register_bloc.dart';
import 'package:new_app/user_repository.dart';
import 'package:new_app/register/register.dart';
import 'package:new_app/register/register_form.dart';

class RegisterScreen extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _RegisterBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _RegisterBloc = RegisterBloc(
      userRepository: _userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Register')),
        body: Center(
          child: BlocProvider<RegisterBloc>(
            bloc: _RegisterBloc,
            child: RegsterForm(),
          ),
        ));
  }

  @override
  void dispose() {
    _RegisterBloc.dispose();
    super.dispose();
  }

  //lanjut Registerform
}
