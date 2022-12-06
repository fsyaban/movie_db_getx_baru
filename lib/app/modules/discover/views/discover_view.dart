import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db_getx_baru/app/data/const.dart';
import 'package:movie_db_getx_baru/app/data/models/discover/discover_response.dart';
import 'package:movie_db_getx_baru/app/routes/app_pages.dart';
import 'package:movie_db_getx_baru/app/data/Const.dart' as constt;
import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DiscoverView'),
          centerTitle: true,
        ),
        body: FutureBuilder<DiscoverMovieResponse?>(
          future: controller.getDiscoverByGenre(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data?.results?.length,
                  itemBuilder: (context, index) {
                    var dataResult = snapshot.data?.results?[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.MOVIE_DETAIL,
                            arguments: dataResult?.id);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${dataResult?.posterPath}",
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataResult?.title ?? "",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              GoogleFonts.lato().fontFamily),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.movie_creation_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            dataResult?.genreIds
                                                    ?.map((e) =>
                                                        getGenreString(e))
                                                    .join(",") ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: GoogleFonts.lato()
                                                    .fontFamily),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Card(
                                      color: Colors.red[900],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          dataResult?.releaseDate ?? "",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontFamily: GoogleFonts.lato()
                                                  .fontFamily),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  });
            } else {
              // return TextField(decoration: InputDecoration(hintText: 'username',hint),)
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  String getGenreString(int id) {
    switch (id) {
      case 28:
        {
          return "Action";
        }
      case 12:
        {
          return "Adventure";
        }
      case 35:
        {
          return "Comedy";
        }
      case 16:
        {
          return "Animation";
        }
      case 80:
        {
          return "Crime";
        }
      case 99:
        {
          return "Documentary";
        }
      case 18:
        {
          return "Drama";
        }
      case 10751:
        {
          return "Family";
        }
      case 14:
        {
          return "Fantasy";
        }
      case 36:
        {
          return "History";
        }
      case 27:
        {
          return "Horror";
        }
      case 10402:
        {
          return "Music";
        }
      case 9648:
        {
          return "Mystery";
        }
      case 10749:
        {
          return "Romance";
        }
      case 878:
        {
          return "Science Fiction";
        }
      case 10770:
        {
          return "TV Movie";
        }
      case 53:
        {
          return "Thriller";
        }
      case 10752:
        {
          return "War";
        }
      case 37:
        {
          return "Western";
        }
      default:
        {
          return "";
        }
    }
  }
}
