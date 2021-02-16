part of 'models.dart';

class Tickets extends Equatable {
  final MovieDetails movieDetails;
  final String bookingCode;
  final Theater theater;
  final DateTime time;
  final List<String> seats;
  final int totalPrice;
  final String name;

  Tickets(this.movieDetails, this.bookingCode, this.seats, this.theater,
      this.name, this.time, this.totalPrice);

  Tickets copyWith(
          {MovieDetails movieDetails,
          String bookingCode,
          Theater theater,
          DateTime time,
          List<String> seats,
          int totalPrice,
          String name}) =>
      Tickets(
          movieDetails ?? this.movieDetails,
          bookingCode ?? this.bookingCode,
          seats ?? this.seats,
          theater ?? this.theater,
          name ?? this.name,
          time ?? this.time,
          totalPrice ?? this.totalPrice);

  String get seatsInString {
    String s = '';
    for (var seat in seats) {
      s += seat + ((seat != seats.last) ? ', ' : '');
    }
    return s;
  }

  @override
  List<Object> get props =>
      [movieDetails, bookingCode, seats, theater, time, totalPrice];
}
