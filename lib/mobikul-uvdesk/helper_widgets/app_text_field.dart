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
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/email_validator.dart';
class AppTextField with EmailValidator {


Widget getTextField(
    BuildContext context,
    TextEditingController controller,
    String label,
    String hint,
    String validationMsg, {
      FormFieldValidator<String>? validator,
      String? validLabel,
      String? emailValue,
      bool showPassword = true,
      IconButton? iconButton,
      bool? readOnly,
    }) =>
    TextFormField(
      // focusNode: FocusNode(),
      readOnly: readOnly ?? false,
      style: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      obscureText: !showPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color:MobikulTheme.accentColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red.shade500),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        suffixIcon: iconButton,
      ),
      validator: validator,
      // onSaved: (email) {
      //   emailValue = email!;
      // },
      // onChanged: (email) {
      //   emailValue = email;
      // },
      // textInputAction: TextInputAction.next,
      // keyboardType: TextInputType.emailAddress,
    );

}