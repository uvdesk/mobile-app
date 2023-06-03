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


import 'package:hive/hive.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/pref_keys.dart';

final appStoragePref = AppStoragePref();
class AppStoragePref {
  late Box agentStorage; //-----Use only for agent specific data

  init() async {
    agentStorage = await Hive.openBox(PreferenceKeys.agentStorageName);
  }

  /// agent storage start
  bool isLoggedIn() {
    return agentStorage.get(PreferenceKeys.isLoggedIn) ?? false;
  }

  setIsLoggedIn(bool? value) {
    agentStorage.put(PreferenceKeys.isLoggedIn, value);
  }

  String getUserToken() {
    return agentStorage.get(PreferenceKeys.agentAuthToken) ?? "";
  }

  setUserToken(String? value) {
    agentStorage.put(PreferenceKeys.agentAuthToken, value ?? "");
  }

  String getAgentName() {
    return agentStorage.get(PreferenceKeys.agentName) ?? "";
  }

  setAgentName(String? value) {
    agentStorage.put(PreferenceKeys.agentName, value ?? "");
  }

  String getAgentProfileImage() {
    return agentStorage.get(PreferenceKeys.agentProfileImage) ?? "";
  }

  setAgentProfileImage(String? value) {
    agentStorage.put(PreferenceKeys.agentProfileImage, value ?? "");
  }

  String getAgentEmail() {
    return agentStorage.get(PreferenceKeys.agentEmail) ?? "";
  }

  setAgentEmail(String? value) {
    agentStorage.put(PreferenceKeys.agentEmail, value ?? "");
  }

  List<String> getAgentScope(){
    return agentStorage.get(PreferenceKeys.agentScopePermissions)?? [];
  }
  setAgentScope (List<String> values){
    agentStorage.put(PreferenceKeys.agentScopePermissions, values);
  }



  logoutAgent() {
    agentStorage.clear();
  }
  /// agent storage end

}