import 'dart:developer';
import 'package:dio/dio.dart';
import 'base_gift_card.dart';
import '../../models/index.dart';

class GiftCardRepository extends BaseGiftCard {
  GiftCardRepository(Dio dio) : _dio = dio;
  final Dio _dio;
  static const _giftCards = '/gift-cards';

  /// Creates a Gift Card that can redeemed by its unique code. The Gift Card is only valid within 1 region.
  @override
  Future<GiftCard?> createGiftCard({
    required UserCreateGiftCardReq userCreateGiftCardReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(
        _giftCards,
        data: userCreateGiftCardReq.toJson(),
      );
      if (response.statusCode == 200) {
        return GiftCard.fromJson(response.data['gift_card']);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Deletes a Gift Card
  @override
  Future<UserDeleteGiftCardRes?> deleteGiftCard({
    /// The ID of the Gift Card to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.delete(
        '$_giftCards/$id',
      );
      if (response.statusCode == 200) {
        return UserDeleteGiftCardRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieves a Gift Card.
  @override
  Future<GiftCard?> retrieveGiftCard({
    /// The ID of the Gift Card.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.get(
        '$_giftCards/$id',
      );
      if (response.statusCode == 200) {
        return GiftCard.fromJson(response.data['gift_card']);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieves a list of Gift Cards.
  @override
  Future<UserGiftCardsRes?> retrieveGiftCards({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.get(
        _giftCards,
      );
      if (response.statusCode == 200) {
        return UserGiftCardsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Update a Gift Card that can redeemed by its unique code. The Gift Card is only valid within 1 region.
  @override
  Future<GiftCard?> updateGiftCard({
    /// The ID of the Gift Card.
    required String id,
    required UserUpdateGiftCardReq userUpdateGiftCardReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dio.options.headers.addAll(customHeaders);
      }
      final response = await _dio.post(
        '$_giftCards/$id',
        data: userUpdateGiftCardReq.toJson(),
      );
      if (response.statusCode == 200) {
        return GiftCard.fromJson(response.data['gift_card']);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
