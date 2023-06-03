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

import 'package:json_annotation/json_annotation.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/base_model.dart';

part 'login_model.g.dart';
@JsonSerializable(explicitToJson: true)
class LoginModel extends BaseModel{
  @JsonKey(defaultValue: false)
  final bool success;
  @JsonKey(defaultValue: '')
  final String accessToken;
  @JsonKey(defaultValue: [])
  final List<String> scopes;

  const LoginModel({
    required this.success,
    required this.accessToken,required this.scopes,  super.status = false ,super.message ='', super.errorCode =''
  });





  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
