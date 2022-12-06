import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/movie_detail/movie_detail_model.dart';
import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<MovieDetailResponse?>(
      future: controller.getMovie(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              AppBar(
                title: Text(snapshot.data?.title ?? ""),
              ),
              BackgroundImage(
                backgroundUrl:
                    "https://image.tmdb.org/t/p/w500${snapshot.data?.backdropPath}",
                posterUrl:
                    "https://image.tmdb.org/t/p/w500${snapshot.data?.posterPath}",
              ),
              getDescription(snapshot),
              overviewTx(),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(snapshot.data?.overview ?? "",
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontFamily: GoogleFonts.lato().fontFamily)),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Container overviewTx() {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 20),
      child: Row(
        children: const [
          SizedBox(
              width: 5,
              height: 20,
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 186, 29, 18)),
              )),
          SizedBox(
            width: 5,
          ),
          Text("Overview", style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }

  Container getDescription(AsyncSnapshot<MovieDetailResponse?> snapshot) {
    return Container(
      padding: EdgeInsets.only(left: 180, top: 10),
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              snapshot.data?.title ?? "",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lato().fontFamily),
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Icon(Icons.date_range),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  snapshot.data?.releaseDate ?? "",
                  style: TextStyle(
                      fontSize: 14, fontFamily: GoogleFonts.lato().fontFamily),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Icon(Icons.remove_red_eye),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  snapshot.data?.popularity.toString() ?? "",
                  style: TextStyle(
                      fontSize: 14, fontFamily: GoogleFonts.lato().fontFamily),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Icon(Icons.grade),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  snapshot.data?.voteAverage.toString() ?? "",
                  style: TextStyle(
                      fontSize: 14, fontFamily: GoogleFonts.lato().fontFamily),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  String backgroundUrl;
  String posterUrl;
  BackgroundImage(
      {super.key, required this.backgroundUrl, required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(backgroundUrl), fit: BoxFit.cover)),
            width: double.infinity,
            child: Container(
              height: 160.0,
              width: 300.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.1), Colors.black],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: 15,
            top: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                posterUrl,
                width: 150,
                height: 240,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

