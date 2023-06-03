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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticket/ticket_details.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/repository/ticket_detail_repository/ticket_detail_repository_impl.dart';

part 'ticket_detail_event.dart';
part 'ticket_detail_state.dart';

class TicketDetailBloc extends Bloc<TicketDetailEvent, TicketDetailState> {
  TicketDetailRepositoryImpl? repository;
  int ticketId;

  TicketDetailBloc({required this.repository, required this.ticketId})
      : super(TicketDetailStateInitial()) {
    on<TicketDetailEvent>(mapEventToState);
  }

  void mapEventToState(
      TicketDetailEvent event, Emitter<TicketDetailState> emit) async {
    if (event is TicketDetailEventInitial) {
      emit(TicketDetailStateInitial());
      try {
        var model = await repository?.getTicketDetails(ticketId);
        if (model != null) {
          emit(TicketDetailStateSuccess(model));
        } else {
          emit(TicketDetailStateError(""));
        }
      } catch (error, _) {
        if (error is DioError) {
          if (error.response != null) {
            final message = error.response!.data['message'];
            emit(TicketDetailStateError(message));
          } else {
            emit(TicketDetailStateError(error.response.toString()));
          }
        } else {
          debugPrint(error.toString());
          emit(TicketDetailStateError(error.toString()));
        }
      }
    }
  }
}
