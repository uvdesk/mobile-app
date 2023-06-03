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

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginStateInitial extends LoginState {
  @override
  List<Object?> get props => [];
}
class LoginStateLoadUI extends LoginState {
  @override
  List<Object?> get props => [];
}
class LoginStateLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginStateSuccess extends LoginState {
  final LoginModel data;
  final String email;

  const LoginStateSuccess(this.data, this.email);

  @override
  List<Object?> get props => [];
}

class LoginStateError extends LoginState {
  final String message;
  const LoginStateError(this.message);

  @override
  List<Object?> get props => [];
}
