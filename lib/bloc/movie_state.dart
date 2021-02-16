part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movie;

  MovieLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}
