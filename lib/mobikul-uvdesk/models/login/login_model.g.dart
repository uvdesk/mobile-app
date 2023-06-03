// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      success: json['success'] as bool? ?? false,
      accessToken: json['accessToken'] as String? ?? '',
      scopes: (json['scopes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      errorCode: json['error_code'] as String? ?? '',
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error_code': instance.errorCode,
      'success': instance.success,
      'accessToken': instance.accessToken,
      'scopes': instance.scopes,
    };
