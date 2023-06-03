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

abstract class TicketDetailRepository {
  Future<TicketDetails> getTicketDetails(int ticketId);
}