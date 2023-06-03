// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_add_reply_thread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketAddReplyThread _$TicketAddReplyThreadFromJson(
        Map<String, dynamic> json) =>
    TicketAddReplyThread(
      error: json['error'] as String? ?? '',
      description: json['description'] as String? ?? '',
      success: json['success'] as String? ?? '',
    );

Map<String, dynamic> _$TicketAddReplyThreadToJson(
        TicketAddReplyThread instance) =>
    <String, dynamic>{
      'error': instance.error,
      'description': instance.description,
      'success': instance.success,
    };
