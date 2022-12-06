import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/Const.dart';

import '../models/genre/genre_response_model.dart';

class GenreResponseProvider extends GetConnect {
  Future<GenreResponse?> getGenreResponse() async {
    final response = await get('${Const.baseUrl}genre/movie/list',
        query: {"api_key": Const.apiKey});
    return GenreResponse.fromJson(response.body);
  }
}
