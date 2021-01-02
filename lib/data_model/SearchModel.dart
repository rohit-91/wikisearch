import 'package:flutter/material.dart';
import 'package:wikisearch/utils/ApiUtils.dart';
import 'package:wikisearch/utils/CommonUtils.dart';
import 'package:wikisearch/values/Constant.dart';

class SearchModel extends ChangeNotifier {
  final List searchResults = [];
  bool isSearching = false;

  void search(String search) async {
    isSearching = true;
    clearData();
    Map response = await ApiUtils.callSearch(search);
    if (response != null) {
      List list = response["query"]["pages"];
      if (list != null && list.length > 0) {
        searchResults.addAll(list);
      }
    }
    isSearching = false;
    notifyListeners();
  }

  String getImageUrl(int position) {
    if (searchResults[position]["thumbnail"] != null) {
      String url = searchResults[position]["thumbnail"]["source"];
      if (url != null && url.length > 0) {
        return url;
      } else {
        return Constant.placeHolderUrl;
      }
    } else {
      return Constant.placeHolderUrl;
    }
  }

  String getTitle(int position) {
    return searchResults[position]["title"];
  }

  String getDescription(int position) {
    return searchResults[position]["terms"]["description"][0];
  }

  String getUrl(int position) {
    return CommonUtils.getSearchUrl(searchResults[position]["title"]);
  }

  void clearData() {
    searchResults.clear();
    notifyListeners();
  }
}
