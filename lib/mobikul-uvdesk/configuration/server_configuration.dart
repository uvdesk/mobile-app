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

const String baseUrl = "https://uvdesktest.webkul.com/uvdesk1.1/public/api/v1"; // Demo Instance for application
const String demoUserName = "anchit.makkar849@webkul.in";
const String demoPassword = "webkul@123";
const bool logApiCalls = true;






class ApiRoutes {
  static const String loginApiPath = "/session/login";
  static const String logoutApiPath = "/session/logout";
  static const String ticketListApiPath = "/tickets";
  static const String myProfileApiPath = "/me";
  static const String ticketDetailsPath = "/ticket/{ticketId}";
  static const String ticketReplyPath = "/ticket/{ticketId}/thread";


}