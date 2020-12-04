import 'package:flutter/material.dart';
import 'package:new_app/user_repository.dart';
import 'package:new_app/register/register.dart';

class CreateAccountButton extends StatefulWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return RegisterScreen(UserRepository: _userRepository);
          }));
        },
        child: Text(
          'Create an Account',
        ));
  }
}
//lanjut ke google login button
