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

const String baseUrl = ""; // TODO Replace with the base uvdesk instance url e.g https://uvdesktest.webkul.com/uvdesk1.1/public/api/v1
const String demoUserName = ""; //TODO Replace with your demo username. Add value only for building test application. Make sure to empty this for production app.
const String demoPassword = ""; //TODO Replace with your demo password. Add value only for building test application. Make sure to empty this for production app.
const bool logApiCalls = true;






class ApiRoutes {
  static const String loginApiPath = "/session/login";
  static const String logoutApiPath = "/session/logout";
  static const String ticketListApiPath = "/tickets";
  static const String myProfileApiPath = "/me";
  static const String ticketDetailsPath = "/ticket/{ticketId}";
  static const String ticketReplyPath = "/ticket/{ticketId}/thread";


}