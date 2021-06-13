// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    index: json['index'] as int,
    name: json['name'] as String,
    picture: json['picture'] as String,
    gender: json['gender'] as String,
    age: json['age'] as int,
    email: json['email'] as String,
    phone: json['phone'] as String,
    company: json['company'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'picture': instance.picture,
      'gender': instance.gender,
      'age': instance.age,
      'email': instance.email,
      'phone': instance.phone,
      'company': instance.company,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://www.json-generator.com/api/json/get/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Post>> getTask() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Post>>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/ceLGCumWjS?indent=2',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Post.fromJson(i as Map<String, dynamic>))
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
