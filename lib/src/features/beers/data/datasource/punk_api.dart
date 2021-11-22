import 'package:dio/dio.dart';
import 'package:flutter_sandbox/src/features/beers/data/model/remote_beer_response.dart';
import 'package:retrofit/retrofit.dart';

part 'punk_api.g.dart';

/// See [documentation](https://punkapi.com/documentation/v2)
@RestApi(baseUrl: 'https://api.punkapi.com/v2/')
abstract class PunkApi {
  factory PunkApi(Dio dio, {String baseUrl}) = _PunkApi;

  /// Fetches beers list from remote API.
  ///
  /// Fetch operation is paginated; it concerns given [page] and fetches
  /// [perPage] max items.
  @GET("/beers")
  Future<HttpResponse<List<RemoteBeerResponse>>> getBeers(
      @Query('page') int page, @Query('per_page') int perPage);
}
