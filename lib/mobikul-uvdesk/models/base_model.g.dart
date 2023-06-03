// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      errorCode: json['error_code'] as String? ?? '',
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error_code': instance.errorCode,
    };
