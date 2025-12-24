import 'package:dio/dio.dart';
import 'package:style_hub/core/constants/api_constants.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/core/services/api_service.dart';
import 'package:style_hub/features/home/data/models/collection_item_model.dart';

abstract class SearchDataSource {
  Future<List<CollectionItemModel>> searchProducts({required String query});
}

class SearchDataSourceImpl implements SearchDataSource {
  final ApiService apiService;

  SearchDataSourceImpl({required this.apiService});
  @override
  Future<List<CollectionItemModel>> searchProducts({
    required String query,
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
      final List<dynamic> collectionItems = jsonData['items'];
      final allProducts = collectionItems
          .map((e) => CollectionItemModel.fromJson(e))
          .toList();
      return allProducts.where((element) {
        return element.name.toLowerCase().contains(query.toLowerCase()) ||
            element.arabicName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
