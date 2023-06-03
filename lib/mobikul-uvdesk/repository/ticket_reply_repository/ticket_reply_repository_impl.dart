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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/network/api_client_retrofit.dart';

import 'ticket_reply_repository.dart';

class TicketReplyRepositoryImpl implements TicketReplyRepository {
  @override
  Future<TicketAddReplyThread> addReply(
      int ticketId,
      String actAsType,
      String actAsEmail,
      String threadType,
      String message,
      List<MultipartFile>? attachmentList,
      String replyStatus
      ) async{
    TicketAddReplyThread? responseModel;
    List<MultipartFile>? attachment0 =[];
    List<MultipartFile>? attachment1 = [];
    List<MultipartFile>? attachment2= [];
    List<MultipartFile>? attachment3= [];
    List<MultipartFile>? attachment4= [];
    if(attachmentList != null){
      if(attachmentList.isNotEmpty){
        attachment0.add(attachmentList.elementAt(0)) ;
        if(attachmentList.length >1){
          attachment1.add(attachmentList.elementAt(1));
        }
        if(attachmentList.length>2){
          attachment2.add(attachmentList.elementAt(2));
        }
        if(attachmentList.length >3){
          attachment3.add(attachmentList.elementAt(3));
        }
        if(attachmentList.length>4){
          attachment4.add(attachmentList.elementAt(4));
        }
      }
    }


    responseModel = await ApiClientRetrofit().addReply(ticketId, actAsType, actAsEmail, threadType, message, attachment0, attachment1,attachment2,attachment3,attachment4, replyStatus.isNotEmpty ? replyStatus : null);

    return responseModel;

  }

}
