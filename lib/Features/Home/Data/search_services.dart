import 'package:dio/dio.dart';

import '../../../Core/Const/app_urls.dart';
import '../../../Core/Helper/dio_helper.dart';

class SearchServices {
  Future<Response> getCities({String? search}) async {
    return await DioHelper.postData(
        url: AppUrls.search, data: {"search": search});
  }
}
