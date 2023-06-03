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
import 'package:html/parser.dart';

class Utils {
  static void hideSoftKeyBoard() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static IconData getSourceIcon (String source){
    // email, api, website, formbuilder
    switch (source) {
      case "email":
        return Icons.mail;
      case "api":
        return Icons.code;
      case "formbuilder":
        return Icons.segment;
      case "website":
      default:
        return Icons.public;

    }
  }

  static IconData getThreadIcon (String threadType){
    switch (threadType) {
      case "create":
        return Icons.add_circle_rounded;
      case "reply":
        return Icons.reply_rounded;
      case "note":
        return Icons.sticky_note_2_outlined;
      default:
        return Icons.note_alt_outlined;
    }
  }

  static String parseHtmlString(String htmlString) {
    final document = parse( htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }



}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
  // String toEllipsisMiddle() =>
}