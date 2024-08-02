import 'package:dio/dio.dart';
import 'package:watch_store_app/utils/shared_preferences_manager.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? token = SharedPreferencesManager().getString('token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}

class DioManager {
  static final Dio _dio = Dio();
  static Dio get dio => _dio..interceptors.add(AuthorizationInterceptor());
}
