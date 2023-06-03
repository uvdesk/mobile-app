// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_retrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClientRetrofit implements ApiClientRetrofit {
  _ApiClientRetrofit(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://uvdesktest.webkul.com/uvdesk1.1/public/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginModel> login(String basicAuthHeaderValue) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': basicAuthHeaderValue};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/session/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DashboardTicketList> getTicketList(int page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DashboardTicketList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/tickets',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DashboardTicketList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MyProfile> getMyProfileDetails() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MyProfile>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/me',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyProfile.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseModel> logOut() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/session/logout',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DashboardTicketList> getSearchTicketList(
    String searchQuery,
    int page,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': searchQuery,
      r'page': page,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DashboardTicketList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/tickets',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DashboardTicketList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TicketDetails> getTicketDetails(int ticketId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<TicketDetails>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ticket/${ticketId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TicketDetails.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TicketAddReplyThread> addReply(
    int ticketId,
    String actAsType,
    String actAsEmail,
    String threadType,
    String message,
    List<MultipartFile>? attachment0,
    List<MultipartFile>? attachment1,
    List<MultipartFile>? attachment2,
    List<MultipartFile>? attachment3,
    List<MultipartFile>? attachment4,
    String? replyStatus,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'actAsType',
      actAsType,
    ));
    _data.fields.add(MapEntry(
      'actAsEmail',
      actAsEmail,
    ));
    _data.fields.add(MapEntry(
      'threadType',
      threadType,
    ));
    _data.fields.add(MapEntry(
      'message',
      message,
    ));
    if (attachment0 != null) {
      _data.files.addAll(attachment0.map((i) => MapEntry('attachments[0]', i)));
    }
    if (attachment1 != null) {
      _data.files.addAll(attachment1.map((i) => MapEntry('attachments[1]', i)));
    }
    if (attachment2 != null) {
      _data.files.addAll(attachment2.map((i) => MapEntry('attachments[2]', i)));
    }
    if (attachment3 != null) {
      _data.files.addAll(attachment3.map((i) => MapEntry('attachments[3]', i)));
    }
    if (attachment4 != null) {
      _data.files.addAll(attachment4.map((i) => MapEntry('attachments[4]', i)));
    }
    if (replyStatus != null) {
      _data.fields.add(MapEntry(
        'status',
        replyStatus,
      ));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TicketAddReplyThread>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/ticket/${ticketId}/thread',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TicketAddReplyThread.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
