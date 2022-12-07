import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_db_getx_baru/app/routes/app_pages.dart';

import '../../../data/models/genre/genre_response_model.dart';
import '../controllers/genre_controller.dart';

class GenreView extends GetView<GenreController> {
  const GenreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Obx(() => Visibility(
              visible: controller.selectedGenres.isNotEmpty,
              child: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  Get.toNamed(Routes.DISCOVER,
                      arguments: controller.selectedGenres
                          .map((element) => element.id)
                          .toList());
                },
              ),
            )),
        appBar: GenreAppBar(),
        body: FutureBuilder<GenreResponse?>(
          future: controller.getGenre(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                controller: ScrollController(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data?.genres.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Obx(() => Card(
                            color: controller.selectedGenres
                                    .contains(snapshot.data?.genres[index])
                                ? Colors.cyan
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ListTile(
                                onLongPress: () {
                                  Genres? genre = snapshot.data?.genres[index];
                                  if (genre != null) {
                                    toggleGenre(genre);
                                  }
                                },
                                onTap: () {
                                  if (controller.selectedGenres.isEmpty) {
                                    Get.toNamed(Routes.DISCOVER,
                                        arguments: List<int>.of([
                                          snapshot.data?.genres[index].id ?? 0
                                        ]));
                                  } else {
                                    Genres? genre =
                                        snapshot.data?.genres[index];
                                    if (genre != null) {
                                      toggleGenre(genre);
                                    }
                                  }
                                },
                                title: Text(snapshot.data?.genres[index].name ??
                                    ""),
                                subtitle: Text(snapshot.data?.genres[index].id
                                        .toString() ??
                                    "01")),
                          )),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  void toggleGenre(Genres genre) {
    if (controller.selectedGenres.contains(genre)) {
      controller.selectedGenres.remove(genre);
    } else {
      controller.selectedGenres.add(genre);
    }
  }
}

class GenreAppBar extends StatelessWidget implements PreferredSizeWidget {
  GenreAppBar({super.key});
  GenreController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
          title: controller.selectedGenres.isEmpty
              ? Text("Select Genre")
              : Text('${controller.selectedGenres.length} Selected'),
          leading: controller.selectedGenres.isNotEmpty
              ? ElevatedButton(
                  onPressed: () {
                    controller.selectedGenres.clear();
                  },
                  child: Icon(Icons.close))
              : null,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
