import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/Const.dart';
import 'package:movie_db_getx_baru/app/data/models/discover/discover_response.dart';

class DiscoverProvider extends GetConnect {
  Future<DiscoverMovieResponse?> getDiscoverMovieByGenre(
      List<int> genres) async {
    var path = "discover/movie";
    var response = await get('${Const.baseUrl}$path',
        query: {"api_key": Const.apiKey, "with_genres": genres.join(",")});
    return DiscoverMovieResponse.fromJson(response.body);
  }
}
