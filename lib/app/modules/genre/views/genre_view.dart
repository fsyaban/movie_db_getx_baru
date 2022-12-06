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
        appBar: AppBar(
          title: const Text('GenreView'),
          centerTitle: true,
        ),
        body: FutureBuilder<GenreResponse?>(
          future: controller.getGenre(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data?.genres?.length,
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
                                onTap: () {
                                  Genres? genre = snapshot.data?.genres[index];
                                  if (genre != null) {
                                    if (controller.selectedGenres
                                        .contains(genre)) {
                                      controller.selectedGenres.remove(genre);
                                    } else {
                                      controller.selectedGenres.add(genre);
                                    }
                                  }
                                  print(controller.selectedGenres
                                      .map((element) => element.name)
                                      .toString());
                                },
                                title: Text(
                                    snapshot.data?.genres?[index].name ??
                                        " KOSHOOONGGG"),
                                subtitle: Text(snapshot.data?.genres?[index].id
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
}
