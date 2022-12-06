import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/data/models/discover/discover_response.dart';
import 'package:movie_db_getx_baru/app/data/providers/discover_provider.dart';

class DiscoverController extends GetxController {
  var genre = Get.arguments;
  var discoverProvider = Get.put(DiscoverProvider());
  
  Future<DiscoverMovieResponse?> getDiscoverByGenre() async {
    return await discoverProvider.getDiscoverMovieByGenre(genre);
  }
}
