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
abstract class TicketDetailEvent extends Equatable {}

class TicketDetailEventInitial extends TicketDetailEvent {
  @override
  List<Object?> get props => [];
}

class TicketDetailEventSuccess extends TicketDetailEvent {
  @override
  List<Object?> get props => [];
}

class TicketDetailEventError extends TicketDetailEvent {
  final String message;

  TicketDetailEventError(this.message);

  @override
  List<Object?> get props => [];
}
