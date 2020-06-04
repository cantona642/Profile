import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';

class SimpleBlocDelegate extends BlocDelegate {

  @override
  void onError(Object error, StackTrace stacktrace) {
    // TODO: implement onError
    super.onError(error, stacktrace);
    print(error);
  }

  @override
  void onTransition(Transition transition){
    super.onTransition(transition);
    print(transition);
  }
}