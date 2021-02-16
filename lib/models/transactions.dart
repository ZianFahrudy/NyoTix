part of 'models.dart';

class Transactions extends Equatable {
  final String userID;
  final String title;
  final String subtitle;
  final DateTime time;
  final int amount;
  final String picture;

  Transactions(
      {@required this.userID,
      @required this.title,
      @required this.subtitle,
      @required this.time,
      this.amount = 0,
      this.picture});

  @override
  List<Object> get props => [userID, title, subtitle, time, amount, picture];
}
