import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:wikisearch/utils/ApiEndpoints.dart';

class ApiClientInstance {
  static final chopper = ChopperClient(
    baseUrl: "https://en.wikipedia.org//w/api.php",
    services: [
      // the generated service
      ApiEndPoints.create()
    ],
    interceptors: [
      (Request request) async {
        print("${request.baseUrl} ${request.url} ${request.parameters}");
        return request;
      },
      (Response response) async {
        print("${response.statusCode} ${response.bodyString}");
        return response;
      }
    ],
    converter: JsonConverter(),
  );

  static final apiService = ApiEndPoints.create(chopper);
}
