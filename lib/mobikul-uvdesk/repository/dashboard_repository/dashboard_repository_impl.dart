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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/network/api_client_retrofit.dart';

import 'dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<DashboardTicketList> getTicketList(int page) async{
    DashboardTicketList? responseModel;
    responseModel = await ApiClientRetrofit().getTicketList(page);
    return responseModel;
  }

  @override
  Future<DashboardTicketList> getSearchTicketList(String query, int page) async{
    DashboardTicketList? responseModel;
    responseModel = await ApiClientRetrofit().getSearchTicketList(query, page);
    return responseModel;
  }

  @override
  Future<BaseModel> logout() async{
    BaseModel? model;
    model = await ApiClientRetrofit().logOut();
    return model;
  }



}
