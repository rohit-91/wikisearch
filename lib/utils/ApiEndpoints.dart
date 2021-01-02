import 'package:chopper/chopper.dart';
part "ApiEndpoints.chopper.dart";

@ChopperApi(baseUrl:"")
abstract class ApiEndPoints extends ChopperService{

  static ApiEndPoints create([ChopperClient client]) => _$ApiEndPoints(client);

  @Get(path: '')
  Future<Response> search(
      @Query("action") String action,
      @Query("format") String format,
      @Query("prop") String prop,
      @Query("generator") String generator,
      @Query("redirects") String redirects,
      @Query("formatversion") String formatVersion,
      @Query("piprop") String piProp,
      @Query("pilimit") String piLimit,
      @Query("pithumbsize") String piThumbSize,
      @Query("wbptterms") String wbPtTerms,
      @Query("gpssearch") String gpsSearch,
      @Query("gpslimit") String gpsLimit);
}