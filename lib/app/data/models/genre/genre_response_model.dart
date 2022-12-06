class GenreResponse {
  GenreResponse({
    required this.genres,
  });

  List<Genres> genres;

  factory GenreResponse.fromJson(Map<String, dynamic> json) => GenreResponse(
        genres:
            List<Genres>.from(json["genres"].map((x) => Genres.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genres {
  Genres({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
