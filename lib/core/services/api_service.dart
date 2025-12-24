import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:style_hub/core/constants/api_constants.dart';
import 'package:style_hub/core/constants/constants.dart';

class ApiService {
  final storage = const FlutterSecureStorage();

  Completer<bool>? _refreshCompleter;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {'accept': 'application/json'},
    ),
  );

  ApiService() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await storage.read(key: Constants.accessToken);
          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          // handle 401 by attempting token refresh and retrying once
          if (error.response?.statusCode == 401) {
            final RequestOptions options = error.requestOptions;

            // avoid infinite retry loops
            if (options.extra['retried'] == true) {
              return handler.next(error);
            }

            // If a refresh is already in progress, wait for it
            if (_refreshCompleter != null) {
              final success = await _refreshCompleter!.future;
              if (!success) return handler.next(error);
            } else {
              _refreshCompleter = Completer<bool>();
              try {
                final refreshed = await _refreshToken();
                _refreshCompleter!.complete(refreshed);
              } catch (_) {
                _refreshCompleter!.complete(false);
              }
              final success = await _refreshCompleter!.future;
              _refreshCompleter = null;
              if (!success) return handler.next(error);
            }

            // set new auth header and mark as retried
            final accessToken = await storage.read(key: Constants.accessToken);
            if (accessToken != null && accessToken.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $accessToken';
            }
            options.extra['retried'] = true;

            // retry the original request
            try {
              final Response retryResponse = await dio.fetch(options);
              return handler.resolve(retryResponse);
            } catch (e) {
              return handler.next(error);
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  // Refresh token helper
  Future<bool> _refreshToken() async {
    final refreshToken = await storage.read(key: Constants.refreshToken);
    if (refreshToken == null || refreshToken.isEmpty) return false;

    try {
      // use a plain Dio instance without interceptors to avoid recursion
      final Dio refreshDio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
      final Response resp = await refreshDio.post(
        ApiConstants.refreshTokenEndpoint,
        data: {'refreshToken': refreshToken, 'useCookies': false},
      );

      final data = resp.data as Map<String, dynamic>?;

      if (data == null) return false;

      // adapt to keys your API returns
      final String? newAccess = (data['accessToken'] ?? data['access_token'])
          ?.toString();
      final String? newRefresh = (data['refreshToken'] ?? data['refresh_token'])
          ?.toString();
      final String? expiresAt = (data['expiresAtUtc'] ?? data['expires_at_utc'])
          ?.toString();

      if (newAccess != null && newAccess.isNotEmpty) {
        await storage.write(key: Constants.accessToken, value: newAccess);
      }
      if (newRefresh != null && newRefresh.isNotEmpty) {
        await storage.write(key: Constants.refreshToken, value: newRefresh);
      }
      if (expiresAt != null && expiresAt.isNotEmpty) {
        await storage.write(key: Constants.expiresAtUtc, value: expiresAt);
      }

      return newAccess != null && newAccess.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  // Requests
  Future<Response> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(endpoint, queryParameters: queryParams);
  }

  Future<Response> postRequest({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(endpoint, data: data);
  }

  Future<Response> updateRequest({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    return await dio.put(endpoint, data: data);
  }

  Future<Response> deleteRequest({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    return await dio.delete(endpoint, data: data);
  }
}
