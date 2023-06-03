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

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/dashboard/dashboard_ticket_list.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/repository/dashboard_repository/dashboard_repository_impl.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardRepositoryImpl? repository;

  DashboardBloc({required this.repository}) : super(const DashboardStateInitial(1)) {
    on<DashboardEvent>((event, emit) {
      return mapEventToState(event, emit);
    });
  }

  void mapEventToState(
      DashboardEvent event, Emitter<DashboardState> emit) async {
    if (event is DashboardEventInitial) {
      if(event.page ==1){
        emit(DashboardStateInitial(event.page));
      }
      try {
        var model = await repository?.getTicketList(event.page);
        if (model != null) {
          emit(DashboardStateSuccess(model,false));
        } else {
          emit(const DashboardStateError(""));
        }
      } catch (error, _) {
        if (error is DioError) {
          if (error.response != null) {
            final message = error.response!.data['message'];
            emit(DashboardStateError(message));
          } else {
            emit(DashboardStateError(error.response.toString()));
          }
        } else {
          debugPrint(error.toString());
          emit(DashboardStateError(error.toString()));
        }
      }
    } else if (event is DashboardSearchEvent){
      try{
        var model = await repository?.getSearchTicketList(event.searchQuery,event.page);
        if (model != null) {
          emit(DashboardStateSuccess(model, true));
        } else {
          emit(const DashboardStateError(""));
        }
      }catch (error, _) {
        if (error is DioError) {
          if (error.response != null) {
            final message = error.response!.data['message'];
            emit(DashboardStateError(message));
          } else {
            emit(DashboardStateError(error.response.toString()));
          }
        } else {
          debugPrint(error.toString());
          emit(DashboardStateError(error.toString()));
        }
      }
    }
  }
}
