import 'package:dio/dio.dart';
import 'package:style_hub/core/constants/api_constants.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/core/services/api_service.dart';
import 'package:style_hub/features/cart/data/models/address_model.dart';
import 'package:style_hub/features/cart/data/models/cart_item_model.dart';
import 'package:style_hub/features/cart/data/models/coupon_model.dart';

abstract class CartDataSource {
  Future<void> addToCart({required String productId, required int quantity});
  Future<List<CartItemModel>> getCartItems();
  Future<void> removeCartItem({
    required String productId,
    required String itemId,
  });
  Future<void> updateCartItemByDecrement({
    required String productId,
  });
  Future<CouponModel> applyCoupon({required String couponCode});
  Future<void> addNewAddress({required AddressModel addressModel});
  Future<List<AddressModel>> getMyAddresses();
  Future<void> removeAddress({required String addressId});
  Future<void> updateAddress({required AddressModel addressModel});
}

class CartDataSourceImpl implements CartDataSource {
  final ApiService apiService;

  CartDataSourceImpl({required this.apiService});
  @override
  Future<void> addToCart({
    required String productId,
    required int quantity,
  }) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.addToCartEndPoint,
        data: {
          "productId": productId,
          "quantity": quantity,
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<List<CartItemModel>> getCartItems() async {
    try {
      final res = await apiService.getRequest(
        endpoint: ApiConstants.getCartProductsEndPoint,
      );
      final jsonData = res.data;
      final List<dynamic> cartItems = jsonData['cartItems'];
      return cartItems.map((e) => CartItemModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> removeCartItem({
    required String productId,
    required String itemId,
  }) async {
    try {
      await apiService.deleteRequest(
        endpoint: '${ApiConstants.deleteCartItemEndPoint}/$itemId',
        data: {"id": productId},
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> updateCartItemByDecrement({
    required String productId,
  }) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.updateCartItemByDecrementEndPoint,
        data: {
          "itemId": productId,
          "quantity": 1,
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<CouponModel> applyCoupon({required String couponCode}) async {
    try {
      final res = await apiService.postRequest(
        endpoint: ApiConstants.applyCouponEndPoint,
        data: {"couponCode": couponCode},
      );
      final jsonData = res.data;
      return CouponModel.fromJson(jsonData);
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> addNewAddress({required AddressModel addressModel}) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.addNewAddressEndPoint,
        data: addressModel.toJson(),
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<List<AddressModel>> getMyAddresses() async {
    try {
      final res = await apiService.getRequest(
        endpoint: ApiConstants.getMyAddressesEndPoint,
      );
      final jsonData = res.data;
      final List<dynamic> addresses = jsonData;
      return addresses.map((e) => AddressModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> removeAddress({required String addressId}) async {
    try {
      await apiService.deleteRequest(
        endpoint: '${ApiConstants.removeAddressEndPoint}/$addressId',
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> updateAddress({required AddressModel addressModel}) async {
    try {
      await apiService.updateRequest(
        endpoint: '${ApiConstants.updateAddressEndPoint}/${addressModel.id}',
        data: addressModel.toJson(),
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
