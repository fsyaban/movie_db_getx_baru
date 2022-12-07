import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/models/movie_detail/movie_detail_model.dart';
import 'package:movie_db_getx_baru/app/data/models/movie_video/movie_video_model.dart';
import 'package:movie_db_getx_baru/app/data/providers/movie_detail_provider.dart';
import 'package:movie_db_getx_baru/app/data/providers/movie_video_provider.dart';

class MovieDetailController extends GetxController {
  var movieProvider = Get.put(MovieDetailProvider());
  var movieId = Get.arguments;


  var movieVideoProvider = Get.put(MovieVideoProvider());

  Future<MovieVideo> getMovieVideo() =>
      movieVideoProvider.getVideoById(movieId);

  Future<MovieDetailResponse?> getMovie() =>
      movieProvider.getMovieById(movieId);
}
