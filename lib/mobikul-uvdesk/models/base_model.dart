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

part 'base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseModel {
  @JsonKey(defaultValue: false)
  final bool status;
  @JsonKey(defaultValue: '')
  final String message;
  @JsonKey(name: 'error_code', defaultValue: '')
  final String errorCode;

  const BaseModel({
    required this.status,
    required this.message,
    required this.errorCode,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
