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

import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticket/ticket_details.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/network/api_client_retrofit.dart';

import 'ticket_detail_repository.dart';

class TicketDetailRepositoryImpl implements TicketDetailRepository {
  @override
  Future<TicketDetails> getTicketDetails(int ticketId) async {
    TicketDetails? responseModel;
    responseModel = await ApiClientRetrofit().getTicketDetails(ticketId);
    return responseModel;
  }

}
