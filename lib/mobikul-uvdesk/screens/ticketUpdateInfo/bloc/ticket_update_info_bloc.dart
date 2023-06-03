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
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticket/ticket_details.dart';

part 'ticket_update_info_event.dart';
part 'ticket_update_info_state.dart';

class TicketUpdateInfoBloc extends Bloc<TicketUpdateInfoEvent, TicketUpdateInfoState> {
  final TicketDetails model;
  TicketUpdateInfoBloc({required this.model}) : super(TicketUpdateInfoInitialState(model)) {
    on<TicketUpdateInfoEvent>((event, emit) {
      if(event is TicketUpdateInfoInitialEvent){
        emit(TicketUpdateInfoInitialState(model));
      }
    });
  }
}
