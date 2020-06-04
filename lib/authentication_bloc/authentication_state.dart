import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

//part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable{
  AuthenticationState([List props = const []]) : super(props);
}

//class AuthenticationInitial extends AuthenticationState {}
class Uninitialized extends AuthenticationState{
  @override
  String toString() => 'Unintialized';
}

class Authenticated extends AuthenticationState {
  final String displayName;

  Authenticated(this.displayName) : super([displayName]);

  @override
  String toString() => 'Authenticated {displayName}';
}

class Unauthenticated extends AuthenticationState{
  @override
  String toString() => 'Unauthenticated';
}