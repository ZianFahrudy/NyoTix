part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("Paris Van Java"),
  Theater("Cihampelas Lombok"),
  Theater("Lombok Epicentrum Mall"),
  Theater("Perumnas Akasia 21")
];
