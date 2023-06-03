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

part 'my_profile.g.dart';

@JsonSerializable(explicitToJson: true)
class MyProfile {
  @JsonKey(defaultValue: false)
  final bool success;
  final Me? me;
  @JsonKey(defaultValue: [])
  final List<String> scopes;

  const MyProfile({
    required this.success,
    this.me,
    required this.scopes,
  });

  factory MyProfile.fromJson(Map<String, dynamic> json) =>
      _$MyProfileFromJson(json);

  Map<String, dynamic> toJson() => _$MyProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: false)
  final bool isEnabled;

  const Me({
    required this.id,
    required this.email,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.isEnabled,
  });

  factory Me.fromJson(Map<String, dynamic> json) =>
      _$MeFromJson(json);

  Map<String, dynamic> toJson() => _$MeToJson(this);
}
