import 'package:dio/dio.dart';
import '../../models/store_models/store/inspiration.dart';

class InspirationRepository {
  InspirationRepository(Dio dio) : _dio = dio;
  final Dio _dio;
  static const String _inspiration = '/inspirations';

  Future<List<Inspiration>> getAllInspirations({
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dio.options.headers.addAll(customHeaders);
    }
    _dio.options.connectTimeout = const Duration(seconds: 10);
    try {
      final response = await _dio.get(
        _inspiration,
      );
      if (response.statusCode == 200) {
        final list = response.data!["inspirations"];
        if (list != null) {
          if (list is List) {
            return list
                .map(
                  (map) => Inspiration.fromJson(
                    Map<String, dynamic>.from(map as Map),
                  ),
                )
                .toList();
          } else {
            return [
              Inspiration.fromJson(
                Map<String, dynamic>.from(list as Map),
              ),
            ];
          }
        }
        return [];
      } else {
        throw response;
      }
    } catch (_) {
      rethrow;
    }
  }
}
