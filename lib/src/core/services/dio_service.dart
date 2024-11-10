import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/core/utils/session_manager.dart';
import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

class DioService with ListenableServiceMixin {
  final Dio _dio;
  final SessionManager sessionManager;
  String? _authToken;

  static const String _tokenKey = 'auth_token';

  DioService({required this.sessionManager}) : _dio = Dio() {
    _dio.options.baseUrl = 'https://userapi.carmagard.com/api/v1';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_authToken != null) {
          options.headers['Authorization'] = 'Bearer $_authToken';
        }
        return handler.next(options);
      },
    ));

    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

    _initializeToken();
  }

  Future<void> _initializeToken() async {
    AppLogger.log("Initializing auth token from local storage",
        tag: "DioService");
    try {
      final token = await sessionManager.getCachedBuiltInType(_tokenKey);
      if (token != null && token != _authToken) {
        _authToken = token;
        notifyListeners();
      }
    } catch (e) {
      AppLogger.logError(
        "Error initializing token: $e",
        tag: "DioService",
      );
    }
  }

  Future<void> setAuthToken(String token) async {
    try {
      _authToken = token;
      await sessionManager.storeBuiltInType(_tokenKey, token);
      notifyListeners();
    } catch (e) {
      AppLogger.logError("Unable to set your auth token: $e");
    }
  }

  Future<void> clearAuthToken() async {
    try {
      _authToken = null;
      await sessionManager.deleteStoredBuiltInType(_tokenKey);
      notifyListeners();
    } catch (e) {
      AppLogger.logError("Unable to clear your auth token: $e");
    }
  }

  Future<T?> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      AppLogger.log("Fetching with token: ${_authToken}", tag: "DioService");
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<T?> post<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<T?> put<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<T?> patch<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<T?> delete<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  String _handleError(DioException error) {
    if (error.type == DioExceptionType.badResponse) {
      if (error.response?.data is Map<String, dynamic>) {
        final errorData = error.response?.data as Map<String, dynamic>;
        if (errorData.containsKey('message')) {
          return errorData['message'];
        }
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        return _handleResponseError(error.response?.statusCode);
      case DioExceptionType.cancel:
        return 'Request cancelled';
      default:
        return 'Network error occurred';
    }
  }

  String _handleResponseError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Something went wrong';
    }
  }
}
