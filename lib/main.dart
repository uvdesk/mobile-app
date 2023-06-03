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
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upgrader/upgrader.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/pref_keys.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/uv_desk_app.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/app_storage_pref.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper_widgets/restart_widget.dart';

void main() async {

  String selectedLanguage = "en";
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await appStoragePref.init();
  appStoragePref.agentStorage = await Hive.openBox(PreferenceKeys.agentStorageName);

  runApp( RestartWidget(
    child: UpgradeAlert(
      upgrader:Upgrader(dialogStyle: UpgradeDialogStyle.material),
      child: UvDeskApp(selectedLanguage),
    ),
  ));
}
