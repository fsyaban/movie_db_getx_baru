import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/models/discover/discover_response.dart';
import 'package:movie_db_getx_baru/app/data/providers/discover_provider.dart';

class DiscoverController extends GetxController {
  List<int> genre = Get.arguments;
  var discoverProvider = Get.put(DiscoverProvider());
  var listDiscoverMovie = List<Results>.empty().obs;
  var discoverScrollController = ScrollController();
  var page = 1.obs;

  @override
  void onInit() {
    getDiscoverByGenre();
    addDiscoverMovies();
    super.onInit();
  }

  Future<DiscoverMovieResponse?> getDiscoverByGenre() async {
    var response =
        await discoverProvider.getDiscoverMovieByGenre(genre, page.value);
    var listMovies = response?.results;
    if (listMovies != null) {
      listDiscoverMovie.addAll(listMovies);
      return response;
    }
    return null;
  }

  addDiscoverMovies()  {
    discoverScrollController.addListener(() {
      if (discoverScrollController.position.maxScrollExtent ==
          discoverScrollController.position.pixels) {
        if (kDebugMode) {
          print('masuk ke scroll controller');
        }
        page++;
        getDiscoverByGenre();
      }
    });
  }
}
