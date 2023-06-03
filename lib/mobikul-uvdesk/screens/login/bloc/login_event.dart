/*
 *  Webkul Software.
 *  @package  Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html
 *  @link https://store.webkul.com/license.html
 *
 */
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEventInitial extends LoginEvent {}
class LoginEventLoadUI extends LoginEvent {}
class LoginEventLoading extends LoginEvent {}

class LoginEventFinal extends LoginEvent {
  final String email;
  final String password;
  LoginEventFinal(this.email, this.password);

  @override
  List<Object> get props => [];
}
