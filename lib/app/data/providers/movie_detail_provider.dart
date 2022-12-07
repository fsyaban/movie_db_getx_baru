import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/Const.dart';

import '../models/movie_detail/movie_detail_model.dart';

class MovieDetailProvider extends GetConnect {
  Future<MovieDetailResponse?> getMovieById(int movieId) async {
    try {
      var response = await get("${Const.baseUrl}movie/$movieId",
          query: {"api_key": Const.apiKey});
      if (response.isOk) {
        return MovieDetailResponse.fromJson(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
