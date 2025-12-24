import 'package:dio/dio.dart';
import 'package:style_hub/core/constants/api_constants.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/core/services/api_service.dart';
import 'package:style_hub/features/home/data/models/collection_item_model.dart';
import 'package:style_hub/features/home/data/models/offer_model.dart';
import 'package:style_hub/features/home/data/models/user_model.dart';

abstract class HomeDataSource {
  Future<List<OfferModel>> getOffers();
  Future<List<CollectionItemModel>> getCollectionItems({
    required int page,
  });
  Future<UserModel> getUsreInfo();
}

class HomeDataSourceImpl implements HomeDataSource {
  final ApiService apiService;

  HomeDataSourceImpl({required this.apiService});
  @override
  Future<List<OfferModel>> getOffers() async {
    try {
      final res = await apiService.getRequest(
        endpoint: ApiConstants.getOffersEndPoint,
        queryParams: {
          "page": 1,
          "pageSize": 5,
        },
      );
      final jsonData = res.data;
      final List<dynamic> offers = jsonData['offers']['items'];
      return offers.map((e) => OfferModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<List<CollectionItemModel>> getCollectionItems({
    required int page,
  }) async {
    try {
      final res = await apiService.getRequest(
        endpoint: ApiConstants.getProductsEndPoint,
        queryParams: {
          "searchTerm": "",
          "category": "",
          "minPrice": 0,
          "maxPrice": 10000,
          "isInStock": true,
          "sortBy": "date",
          "sortOrder": "asc",
          "page": page,
          "pageSize": 10,
        },
      );
      final jsonData = res.data;
      final List<dynamic> collectionItems = jsonData['items'];
      final models = collectionItems
          .map(
            (e) => CollectionItemModel.fromJson(Map<String, dynamic>.from(e)),
          )
          .toList();

      return models;
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<UserModel> getUsreInfo() async {
    try {
      final res = await apiService.getRequest(
        endpoint: ApiConstants.getUserInfoEndPoint,
      );
      final jsonData = res.data;
      return UserModel.fromJson(jsonData);
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
