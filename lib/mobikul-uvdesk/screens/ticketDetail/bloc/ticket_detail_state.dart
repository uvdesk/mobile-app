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

part of 'ticket_detail_bloc.dart';

@immutable
abstract class TicketDetailState {}

class TicketDetailStateInitial extends TicketDetailState {}

class TicketDetailStateSuccess extends TicketDetailState {
  final TicketDetails model;

  TicketDetailStateSuccess(this.model);
}

class TicketDetailStateError extends TicketDetailState {
  final String message;
  TicketDetailStateError(this.message);
}
