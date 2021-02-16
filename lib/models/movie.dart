import 'package:flutter/cupertino.dart';

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double voteAverage;

  Movie(
      {@required this.id,
      @required this.title,
      @required this.backdropPath,
      @required this.posterPath,
      @required this.voteAverage,
      @required this.overview});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview']);
}
