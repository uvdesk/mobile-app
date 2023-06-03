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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/configuration/mobikul_theme.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/application_localization.dart';

import '../constants/string_keys.dart';

class AppDialogHelper {


  static confirmationDialog(
      String text, BuildContext context, ApplicationLocalizations? localizations,
      {VoidCallback? onConfirm,
      VoidCallback? onCancel,
      String? title,
      bool? barrierDismissible}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (ctx) => AlertDialog(
        title: (title != null)
            ? Text(localizations?.translate(title) ?? '')
            : null,
        content: Text(
          localizations?.translate(text) ?? "",
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onCancel != null) {
                onCancel();
              }
            },
            child: Text(
              (localizations?.translate(StringKeys.cancel) ?? "")
                  .toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: MobikulTheme.accentColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(
              (localizations?.translate(StringKeys.ok) ?? "")
                  .toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: MobikulTheme.accentColor),
            ),
          ),
        ],
      ),
    );
  }

  /// information dialog
  static informationDialog(
      String text, BuildContext context, ApplicationLocalizations? localizations,
      {VoidCallback? onConfirm, String? title, bool? barrierDismissible}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (ctx) => AlertDialog(
        title: (title != null)
            ? Text(localizations?.translate(title) ?? '')
            : null,
        content: Text(
          localizations?.translate(text) ?? "",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(
              (localizations?.translate(StringKeys.ok) ?? "")
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// retry dialog
  static errorDialog(
      String text, BuildContext context, ApplicationLocalizations? localizations,
      {String? title,
      bool? cancelable,
      VoidCallback? onConfirm,
      VoidCallback? onDismiss,
      bool? barrierDismissible,
        bool? showTryAgainButton,
        String? cancelButtonTitle
      }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (ctx) => AlertDialog(
        title: Text(localizations?.translate(title!) ?? "",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: MobikulTheme.accentColor),),
        content: Text(
          localizations?.translate(text) ?? "",
        ),
        actions: <Widget>[
          if (cancelable ?? false)
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                if (onDismiss != null) {
                  onDismiss();
                }
              },
              child: Text(
                (localizations?.translate(cancelButtonTitle?? StringKeys.cancel)  ?? "").toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: MobikulTheme.accentColor),
              ),
            ),
          if(showTryAgainButton ?? true)
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(
              (localizations?.translate(StringKeys.tryAgain) ?? "")
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: MobikulTheme.accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
