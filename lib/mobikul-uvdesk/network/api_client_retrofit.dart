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

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:retrofit/http.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/configuration/server_configuration.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/app_storage_pref.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/base_model.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/dashboard/dashboard_ticket_list.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/login/login_model.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/my_profile/my_profile.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticket/ticket_details.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticketReply/ticket_add_reply_thread.dart';

part 'api_client_retrofit.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiClientRetrofit {
  factory ApiClientRetrofit() {
    Dio dio = Dio();
    dio.options = BaseOptions(
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
        baseUrl: baseUrl);
    var bearerToken = appStoragePref.getUserToken();
    if (bearerToken.isNotEmpty) {
      dio.options.headers["Authorization"] = 'Bearer $bearerToken';
    }
    if (logApiCalls) {
      dio.interceptors.add(LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          logPrint: (b) {
            log(b.toString());
          }));
    }

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return _ApiClientRetrofit(dio, baseUrl: baseUrl);
  }

  @POST(ApiRoutes.loginApiPath)
  Future<LoginModel> login(
      @Header("Authorization") String basicAuthHeaderValue);

  @GET(ApiRoutes.ticketListApiPath)
  Future<DashboardTicketList> getTicketList(
    @Query("page") int page,
  );

  @GET(ApiRoutes.myProfileApiPath)
  Future<MyProfile> getMyProfileDetails();

  @POST(ApiRoutes.logoutApiPath)
  Future<BaseModel> logOut();

  @GET(ApiRoutes.ticketListApiPath)
  Future<DashboardTicketList> getSearchTicketList(
    @Query("search") String searchQuery,
    @Query("page") int page,
  );

  @GET(ApiRoutes.ticketDetailsPath)
  Future<TicketDetails> getTicketDetails(
    @Path("ticketId") int ticketId,
  );

  @MultiPart()
  @POST(ApiRoutes.ticketReplyPath)
  Future<TicketAddReplyThread> addReply(
    @Path("ticketId") int ticketId,
    @Part(name: "actAsType") String actAsType,
    @Part(name: "actAsEmail") String actAsEmail,
    @Part(name: "threadType") String threadType,
    @Part(name: "message") String message,
    @Part(name: "attachments[0]") List<MultipartFile>? attachment0,
    @Part(name: "attachments[1]") List<MultipartFile>? attachment1,
    @Part(name: "attachments[2]") List<MultipartFile>? attachment2,
    @Part(name: "attachments[3]") List<MultipartFile>? attachment3,
    @Part(name: "attachments[4]") List<MultipartFile>? attachment4,
    @Part(name: "status") String? replyStatus,
  );
}
