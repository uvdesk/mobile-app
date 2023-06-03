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

import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/base_model.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/dashboard/dashboard_ticket_list.dart';

abstract class DashboardRepository {
  Future<DashboardTicketList> getTicketList(int page);
  Future<DashboardTicketList> getSearchTicketList(String query,int page);
  Future<BaseModel> logout();
}