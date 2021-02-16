part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  static Future<void> saveTickets(String id, Tickets tickets) async {
    await ticketCollection.doc().set({
      'movieID': tickets.movieDetails.id ?? 0,
      'userID': id ?? "",
      'bookingCode': tickets.bookingCode ?? "",
      'theaterName': tickets.theater.name ?? "",
      'time': tickets.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'seats': tickets.seatsInString ?? "",
      'name': tickets.name ?? "No Name",
      'totalPrice': tickets.totalPrice,
    });
  }

  static Future<List<Tickets>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();
    var documents =
        snapshot.docs.where((document) => document.data()['userID'] == userId);

    List<Tickets> tickets = [];
    for (var doc in documents) {
      MovieDetails movieDetails =
          await MovieServices.getDetails(null, movieID: doc.data()['movieID']);
      tickets.add(Tickets(
          movieDetails,
          doc.data()['bookingCode'],
          doc.data()['seats'].toString().split(','),
          Theater(doc.data()['theaterName']),
          doc.data()['name'],
          DateTime.fromMillisecondsSinceEpoch(doc.data()['time']),
          doc.data()['totalPrice']));
    }
    return tickets;
  }
}
