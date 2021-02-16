part of 'models.dart';

class MovieDetails extends Movie {
  final List<String> genres;
  final String languages;

  MovieDetails(Movie movie, {this.genres, this.languages})
      : super(
            id: movie.id,
            title: movie.title,
            overview: movie.overview,
            voteAverage: movie.voteAverage,
            backdropPath: movie.backdropPath,
            posterPath: movie.posterPath);

  String get genreAndLanguage {
    String s = "";

    for (var genre in genres) {
      s += genre + (genre != genres.last ? ", " : "");
    }

    return "$s - $languages ";
  }
}
