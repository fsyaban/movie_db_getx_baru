import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/models/movie_detail/movie_detail_model.dart';
import 'package:movie_db_getx_baru/app/data/providers/movie_detail_provider.dart';

class MovieDetailController extends GetxController {
  var movieProvider = Get.put(MovieDetailProvider());
  var movieId = Get.arguments;

  Future<MovieDetailResponse?> getMovie() => movieProvider.getMovieById(movieId);
}
