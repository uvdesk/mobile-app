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

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/string_keys.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/app_alert_message.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/application_localization.dart';

class DownloadHelper {
  var tag = "DownloadFile";
  String savePath = "";

  Future downloadPersonalData(String url, String fileName,String fileType, BuildContext context) async {
    try {
      debugPrint("DOWNLOAD_URL==> $url");
      Map<Permission, PermissionStatus> status = await [
        Permission.storage,
        //add more permission to request here.
      ].request();
      if (status[Permission.storage]!.isGranted) {
        var dir = await DownloadsPathProvider.downloadsDirectory;
        if(dir != null){

          String saveName = "";
          if (fileType.isNotEmpty) {
            saveName = "${fileName.toString()}.$fileType";
          } else {
            saveName = fileName.toString();
          }
          String savePath = "${dir.path}/$saveName";

          try {
            await Dio().download(
                url,
                savePath,
                onReceiveProgress: (received, total) {
                  if (total != -1) {
                    debugPrint("${(received / total * 100).toStringAsFixed(0)}%");
                  }
                });
            if(context.mounted){
              AlertMessage.showSuccess(ApplicationLocalizations.instance!.translate(StringKeys.fileSavedOnDownloadFolder), context);
            }
            debugPrint("File is saved to download folder.");
          } on DioError catch (e) {
            debugPrint(e.message);
          }
        }
      } else if (status[Permission.storage]!.isDenied) {
        Permission.storage.request();
        if(context.mounted){
          AlertMessage.showError(ApplicationLocalizations.instance!.translate(StringKeys.noPermissionToReadWriteStorage), context);
        }
        debugPrint("${tag}permission is denied ->requesting");
      }
    } catch (e) {
      AlertMessage.showError(ApplicationLocalizations.instance!.translate(StringKeys.somethingWentWrong), context);
      debugPrint("${tag}exception while downloading invoice $e");
    }
  }

  /*
  * Will return the directory path at which invoice will save.
  * it will not return the external directory path
  * ToDo: Need to check it to save it in external directory like Download
  * */
  Future<String> getFilePath(fileName) async {
    String path = '';
    // var pat_h = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
    // Directory dir = await getApplicationDocumentsDirectory();
    Directory? dir =  Platform.isAndroid
        ? await getExternalStorageDirectory() //FOR ANDROID
        : await getApplicationDocumentsDirectory();
    path = '${dir?.path}/$fileName';
    return path;
  }


}