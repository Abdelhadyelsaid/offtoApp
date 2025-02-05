import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:offto/Features/Home/Data/search_model.dart';
import 'package:offto/Features/Home/Data/search_services.dart';

class SearchRepo {
  final SearchServices _searchServices = SearchServices();

  Future<SearchModel> getCities({String? search}) async {
    Response response = await _searchServices.getCities(search: search);
    log(response.data.toString());
    if (response.statusCode != 200) {
      throw Exception('Failed to get cities: ${response.data}');
    }
    if (response.data == null || response.data.isEmpty) {
      throw Exception('failed to get cities');
    }
    return SearchModel.fromJson(response.data);
  }
}
