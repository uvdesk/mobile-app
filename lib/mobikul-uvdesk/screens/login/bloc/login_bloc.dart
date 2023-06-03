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

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/app_storage_pref.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/login/login_model.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/repository/login_repository/login_repository_impl.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepositoryImpl repository;

  LoginBloc({required this.repository}): super(LoginStateInitial()) {
    on<LoginEvent>(mapEventToState);
  }

  void mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if(event is LoginEventInitial){
      emit(LoginStateInitial());
    }else {
      emit(LoginStateLoadUI());
      if(event is LoginEventFinal){
        try {
          var model = await repository.loginApiCall(event.email, event.password);
          if (model.success) {
            appStoragePref.setAgentScope(model.scopes);
            emit( LoginStateSuccess(model, event.email));
          } else {
            emit(const LoginStateError(''));
          }
        } catch (error, _) {
          if(error is DioError){
            if(error.response != null){
              final message = error.response!.data['message'];
              emit(LoginStateError(message));
            }else{
              emit(LoginStateError(error.response!.data.toString()));
            }
          }else {
            emit(LoginStateError(error.toString()));
          }

        }
      }else if(event is LoginEventLoading) {
        emit(LoginStateLoading());
      }
    }

  }

}
