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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticketReply/ticket_add_reply_thread.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/repository/ticket_reply_repository/ticket_reply_repository_impl.dart';

part 'ticket_reply_event.dart';
part 'ticket_reply_state.dart';

class TicketReplyBloc extends Bloc<TicketReplyEvent, TicketReplyState> {
  TicketReplyRepositoryImpl repository;
  TicketDetails ticketData;


  TicketReplyBloc({required this.repository,required this.ticketData }) : super(TicketReplyInitialState()) {
    on<TicketReplyEvent>(mapEventToState);
  }


  void mapEventToState(TicketReplyEvent event, Emitter<TicketReplyState> emit) async {
    if (event is TicketReplyAddReplyEvent){
      emit(TicketReplyLoadingState());
      try {
        var model = await repository.addReply(ticketData.ticket!.id, event.actAsType, event.actAsEmail, event.threadType, event.message, event.attachmentList, event.replyStatus);
        if(model.error.isNotEmpty){
          emit(TicketReplyErrorState(model.description));
        }else{
          emit(TicketReplySuccessState(model));
        }
      }catch(error, _){
        if(error is DioError){
          if(error.response != null){
            final message = error.response!.data['message'];
            emit(TicketReplyErrorState(message));
          }else{
            emit(TicketReplyErrorState(error.response!.data.toString()));
          }
        }else {

          emit(TicketReplyErrorState(error.toString()));
        }

      }
    }else{
      emit(TicketReplyInitialState());
    }

  }

}
