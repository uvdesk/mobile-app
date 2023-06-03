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

import 'dart:convert';

import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/login/login_model.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/network/api_client_retrofit.dart';

import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginModel> loginApiCall(String username, String password) async{
    LoginModel? responseModel;
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    responseModel = await ApiClientRetrofit().login(basicAuth);
    return responseModel;
  }
}
