import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/providers/genre_response_provider.dart';

import '../../../data/models/genre/genre_response_model.dart';

class GenreController extends GetxController {
  GenreResponseProvider genreProvider = Get.put(GenreResponseProvider());
  var selectedGenres = List<Genres>.empty().obs;


  Future<GenreResponse?> getGenre() async {
    return await genreProvider.getGenreResponse();
  }
}
