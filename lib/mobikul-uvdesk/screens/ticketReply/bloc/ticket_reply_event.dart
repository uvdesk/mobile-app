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
abstract class TicketReplyEvent extends Equatable {}

class TicketReplyInitialEvent extends TicketReplyEvent {
  @override
  List<Object?> get props => [];
}

class TicketReplyAddReplyEvent extends TicketReplyEvent {
  final String actAsType;
  final String actAsEmail;
  final String threadType;
  final String message;
  final List<MultipartFile>? attachmentList;
  final String replyStatus;

  TicketReplyAddReplyEvent(this.actAsType, this.actAsEmail, this.threadType,
      this.message, this.attachmentList, this.replyStatus);

  @override
  List<Object?> get props => [];
}
