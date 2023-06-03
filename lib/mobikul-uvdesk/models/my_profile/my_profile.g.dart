// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyProfile _$MyProfileFromJson(Map<String, dynamic> json) => MyProfile(
      success: json['success'] as bool? ?? false,
      me: json['me'] == null
          ? null
          : Me.fromJson(json['me'] as Map<String, dynamic>),
      scopes: (json['scopes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$MyProfileToJson(MyProfile instance) => <String, dynamic>{
      'success': instance.success,
      'me': instance.me?.toJson(),
      'scopes': instance.scopes,
    };

Me _$MeFromJson(Map<String, dynamic> json) => Me(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      isEnabled: json['isEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$MeToJson(Me instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isEnabled': instance.isEnabled,
    };
