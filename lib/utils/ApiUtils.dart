import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:wikisearch/utils/ApiClient.dart';

class ApiUtils {
  static Future<Map> callSearch(String searchText) async {
    Map responseData;
    var search=searchText.replaceAll(" ", "+");
    Response response = await ApiClientInstance.apiService.search(
        "query","json", "pageimages|pageterms", "prefixsearch", "1", "2", "thumbnail", "10", "50", "description", search, "10");
    if (response.statusCode == 200) {
      print(""+response.bodyString);
      responseData = jsonDecode(response.bodyString);
    }
    return responseData;
  }
}
