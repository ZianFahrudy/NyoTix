part of 'models.dart';

class Credits extends Equatable {
  final String name;
  final String profilePath;

  Credits({this.name, this.profilePath});

  @override
  List<Object> get props => [name, profilePath];
}
