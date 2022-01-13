// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qiita_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _QiitaApiClient implements QiitaApiClient {
  _QiitaApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://qiita.com/api/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<QiitaItem>> fetchQiitaItems(tag) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<QiitaItem>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tags/$tag/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => QiitaItem.fromJson(i as Map<String, dynamic>))
        .toList();
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
