import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/const.dart';

import '../models/movie_video/movie_video_model.dart';

class MovieVideoProvider extends GetConnect {
  Future<MovieVideo> getVideoById(int movieId) async {
    var response = await get('${Const.baseUrl}movie/$movieId/videos',
        query: {'api_key': Const.apiKey});
    print(response.body);
    return MovieVideo.fromJson(response.body);
  }
}
