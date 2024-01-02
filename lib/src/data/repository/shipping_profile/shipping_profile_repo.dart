import 'dart:developer';
import 'package:dio/dio.dart';
import 'base_shipping_profile.dart';
import '../../models/index.dart';

class ShippingProfileRepository extends BaseShippingProfile {
  ShippingProfileRepository(Dio dio) : _dio = dio;
  final Dio _dio;
  static const String _shippingProfile = '/shipping-profiles';

  /// Creates a Shipping Profile
  @override
  Future<ShippingProfile?> create({
    required UserCreateShippingProfileReq userCreateShippingProfileReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(_shippingProfile,
          data: userCreateShippingProfileReq.toJson());
      if (response.statusCode == 200) {
        return ShippingProfile.fromJson(response.data['shipping_profile']);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Deletes a Shipping Profile.
  @override
  Future<UserDeleteShippingProfileRes?> delete({
    /// The ID of the Shipping Profile to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.delete('$_shippingProfile/$id');
      if (response.statusCode == 200) {
        return UserDeleteShippingProfileRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieves a Shipping Profile.
  @override
  Future<ShippingProfile?> retrieve({
    /// The ID of the Shipping Profile.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.get(
        '$_shippingProfile/$id',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return ShippingProfile.fromJson(response.data['shipping_profile']);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieves a list of Shipping Profile.
  @override
  Future<UserRetrieveAllShippingProfileRes?> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.get(
        _shippingProfile,
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return UserRetrieveAllShippingProfileRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Updates a Shipping Profile
  @override
  Future<ShippingProfile?> update({
    /// The ID of the Shipping Profile.
    required String id,
    required UserUpdateShippingProfileReq userUpdateShippingProfileReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(
        _shippingProfile,
        data: userUpdateShippingProfileReq.toJson(),
      );
      if (response.statusCode == 200) {
        return ShippingProfile.fromJson(response.data['shipping_profile']);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
