// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiEndpoints.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiEndPoints extends ApiEndPoints {
  _$ApiEndPoints([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiEndPoints;

  Future<Response> search(
      String action,
      String format,
      String prop,
      String generator,
      String redirects,
      String formatVersion,
      String piProp,
      String piLimit,
      String piThumbSize,
      String wbPtTerms,
      String gpsSearch,
      String gpsLimit) {
    final $url = '';
    final Map<String, dynamic> $params = {
      'action': action,
      'format': format,
      'prop': prop,
      'generator': generator,
      'redirects': redirects,
      'formatversion': formatVersion,
      'piprop': piProp,
      'pilimit': piLimit,
      'pithumbsize': piThumbSize,
      'wbptterms': wbPtTerms,
      'gpssearch': gpsSearch,
      'gpslimit': gpsLimit
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
