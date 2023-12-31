import 'dart:developer';
import 'package:dio/dio.dart';

import '../../models/index.dart';
import '../../models/response_models/tax_rate.dart';
import 'base_tax_rate.dart';

class TaxRateRepository extends BaseTaxRate {
  TaxRateRepository(Dio dio) : _dio = dio;
  final Dio _dio;

  /// Associates a Tax Rate with a list of Products
  @override
  Future<TaxRate?> addTaxRateToProducts({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the products to associate with this tax rate
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(
        '/tax-rates/$id/products/batch',
        data: {'products': productIds},
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Associates a Tax Rate with a list of Product Types
  @override
  Future<TaxRate?> addTaxRateToProductType({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the types of products to associate with this tax rate
    required List<String> productTypeIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(
        '/tax-rates/$id/products/batch',
        data: {'product_types': productTypeIds},
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Associates a Tax Rate with a list of Shipping Options
  @override
  Future<TaxRate?> addTaxRateToShippingOptions({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the shipping options to associate with this tax rate.
    required List<String> shippingOptionIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(
        '/tax-rates/$id/products/batch',
        data: {'shipping_options': shippingOptionIds},
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Creates a Tax Rate
  @override
  Future<TaxRate?> createTaxRate({
    required UserCreateTaxRateReq userCreateTaxRateReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(
        '/tax-rates',
        data: userCreateTaxRateReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Deletes a Tax Rate
  @override
  Future<UserDeleteTaxRateRes?> deleteTaxRate({
    /// The ID of the Tax Rate to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.delete(
        '/tax-rates/$id',
      );
      if (response.statusCode == 200) {
        return UserDeleteTaxRateRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Removes a Tax Rate from a list of Products
  @override
  Future<TaxRate?> removeTaxRateFromProduct({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the products to remove association with this tax rate
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.delete(
        '/tax-rates/$id/products/batch',
        data: {'products': productIds},
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Removes a Tax Rate from a list of Product Types
  @override
  Future<TaxRate?> removeTaxRateToProductType({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the types of products to remove association with this tax rate
    required List<String> productTypeIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.delete(
        '/tax-rates/$id/product-types/batch',
        data: {'product-types': productTypeIds},
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Removes a Tax Rate from a list of Shipping Options
  @override
  Future<TaxRate?> removeTaxRateToShippingOption({
    required String id,
    required List<String> shippingOptionIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.delete(
        '/tax-rates/$id/shipping_options/batch',
        data: {'shipping_options': shippingOptionIds},
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieves a TaxRate
  @override
  Future<TaxRate?> retrieveTaxRate({
    /// ID of the tax rate.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.get(
        '/tax-rates/$id',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieves a list of TaxRates
  @override
  Future<UserRetrieveTaxRatesRes?> retrieveTaxRates({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.get(
        '/tax-rates',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return UserRetrieveTaxRatesRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Updates a Tax Rate
  @override
  Future<TaxRate?> updateTaxRate({
    /// ID of the tax rate.
    required String id,
    required UserUpdateTaxRateReq userUpdateTaxRateReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(
        '/tax-rates',
        data: userUpdateTaxRateReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return TaxRate.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}