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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticketReply/ticket_add_reply_thread.dart';

abstract class TicketReplyRepository {

  Future<TicketAddReplyThread> addReply(
      int ticketId,
      String actAsType,
      String actAsEmail,
      String threadType,
      String message,
      List<MultipartFile>? attachmentList,
      String replyStatus
      );
}