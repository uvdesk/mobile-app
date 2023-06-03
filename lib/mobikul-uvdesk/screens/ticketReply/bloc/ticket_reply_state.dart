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

part of 'ticket_reply_bloc.dart';

@immutable
abstract class TicketReplyState{}

class TicketReplyInitialState extends TicketReplyState {

}


class TicketReplyLoadingState extends TicketReplyState {
}

class TicketReplySuccessState extends TicketReplyState {
  final TicketAddReplyThread model;

  TicketReplySuccessState(this.model);


}

class TicketReplyErrorState extends TicketReplyState {
  final String message;
  TicketReplyErrorState(this.message);

}