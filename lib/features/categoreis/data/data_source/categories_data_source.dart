import 'package:dio/dio.dart';
import 'package:style_hub/core/constants/api_constants.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/core/services/api_service.dart';
import 'package:style_hub/features/categoreis/data/models/category_model.dart';
import 'package:style_hub/features/home/data/models/collection_item_model.dart';

abstract class CategoriesDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CollectionItemModel>> getCategoryProducts({
    required String category,
  });
}

class CategoriesDataSourceImpl implements CategoriesDataSource {
  final ApiService apiService;

  CategoriesDataSourceImpl({required this.apiService});

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final res = await apiService.getRequest(
        endpoint: ApiConstants.getCategoriesEndPoint,
      );
      final jsonData = res.data;
      final List<dynamic> categories = jsonData['categories'];
      final List<CategoryModel> categoriesList = [];
      for (var category in categories) {
        if (category['coverPictureUrl'] != null &&
            category['coverPictureUrl'].isNotEmpty &&
            category['coverPictureUrl'].endsWith(".svg")) {
          categoriesList.add(CategoryModel.fromJson(category));
        }
      }
      return categoriesList;
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<List<CollectionItemModel>> getCategoryProducts({
    required String category,
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
          "page": 1,
          "pageSize": 42,
        },
      );
      final jsonData = res.data;
      final List<dynamic> products = jsonData['items'];
      final allProducts = products
          .map((e) => CollectionItemModel.fromJson(e))
          .toList();
      return allProducts.where(
        (element) {
          return element.categories.isNotEmpty &&
              element.categories.contains(category);
        },
      ).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
