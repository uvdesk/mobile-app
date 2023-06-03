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

import 'package:json_annotation/json_annotation.dart';

part 'ticket_add_reply_thread.g.dart';

@JsonSerializable(explicitToJson: true)
class TicketAddReplyThread {
  @JsonKey(defaultValue: '')
  final String error;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String success;

  const TicketAddReplyThread({
    required this.error,
    required this.description,
    required this.success,
  });

  factory TicketAddReplyThread.fromJson(Map<String, dynamic> json) =>
      _$TicketAddReplyThreadFromJson(json);

  Map<String, dynamic> toJson() => _$TicketAddReplyThreadToJson(this);
}
