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
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/configuration/mobikul_theme.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/app_constants.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/app_routes.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/string_keys.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/app_storage_pref.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/application_localization.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("SplashScaffoldKey"),
      backgroundColor: MobikulTheme.accentColor,
      body: Stack(
        key: const Key("SplashStackKey"),
        children: [
          Container(
            key: const Key("SplashContainerKey"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MobikulTheme.accentColor,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            top: MediaQuery.of(context).size.width / 4,
            bottom: MediaQuery.of(context).size.width / 4,
            child: Column(
              children: [
                Image.asset(
                  AppImages.splashScreen,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  key: const Key("SplashImageKey"),
                ),
                Text(
                  ApplicationLocalizations.of(context)!
                      .translate(StringKeys.appName),
                  style: MobikulTheme.mobikulTheme.textTheme.titleLarge?.copyWith(color: MobikulTheme.primaryButtonTextColor),
                  key: const Key("SplashTextKey"),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: CircularProgressIndicator(
                color: MobikulTheme.primaryColor,
                key: const Key("SplashIndicatorKey"),
              ),
            ),
          )
        ],
      ),
    );
  }

  navigateToNextScreen() {
    Timer(const Duration(seconds: AppConstant.defaultSplashDelaySeconds), () async {
      var isLoggedIn = appStoragePref.isLoggedIn();
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    });
  }
}
