part of 'extensions.dart';

extension DateTimeExtensions on DateTime {
  String get dateAndTime =>
      "${this.shortDayName} ${this.day}, ${this.hour}:20 ";
  String get shortDayName {
    switch (this.weekday) {
      case 1:
        return "Mon";
        break;
      case 2:
        return "Tue";
        break;
      case 3:
        return "Wed";
        break;
      case 4:
        return "Thu";
        break;
      case 5:
        return "Fri";
        break;
      case 6:
        return "Sat";
        break;

      default:
        return "Sun";
    }
  }

  String get dayName {
    switch (this.weekday) {
      case 1:
        return "Monday";
        break;
      case 2:
        return "Sunday";
        break;
      case 3:
        return "Tuesday";
        break;
      case 4:
        return "Wednesday";
        break;
      case 5:
        return "Thursday";
        break;
      case 6:
        return "Friday";

        break;
      default:
        return "Saturday";
    }
  }

  String get monthName {
    switch (this.month) {
      case 1:
        return "January";
        break;
      case 2:
        return "February";
        break;
      case 3:
        return "March";
        break;
      case 4:
        return "April";
        break;
      case 5:
        return "May";
        break;
      case 6:
        return "June";
      case 7:
        return "July";
        break;
      case 8:
        return "August";
        break;
      case 9:
        return "September";
        break;
      case 10:
        return "October";
        break;
      case 11:
        return "November";
        break;

      default:
        return "December";
    }
  }
}
