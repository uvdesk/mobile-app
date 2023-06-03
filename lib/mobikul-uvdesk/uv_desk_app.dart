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
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/configuration/mobikul_theme.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/app_routes.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/application_localization.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/navigation/app_navigation.dart'as app_navigation;

class UvDeskApp extends StatefulWidget {
  final String? selectedLanguage;
  const UvDeskApp(
      this.selectedLanguage, {
        Key? key,
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UvDeskAppState();
  }
}

class UvDeskAppState extends State<UvDeskApp> {
  Locale? _locale;
  @override
  void initState() {
    //TODO : update Locale from shared preference as per multi language feature
    _locale = const Locale("en");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MobikulTheme.mobikulTheme,
      localizationsDelegates: const [
        ApplicationLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: AppRoutes.splash,
      onGenerateRoute: app_navigation.generateRoute,
      locale: _locale,
      title: "Mobikul Uv Desk App",
      // localeResolutionCallback: ,// TODO use this once localization is finalised

    );
  }
}