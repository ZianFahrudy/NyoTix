part of 'services.dart';

class TransactionServices {
  static CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');

  static Future<void> saveTransactions(Transactions transactions) async {
    await transactionCollection.doc().set({
      'userID': transactions.userID,
      'title': transactions.title,
      'subtitle': transactions.subtitle,
      'amount': transactions.amount,
      'picture': transactions.picture,
      'time': transactions.time.millisecondsSinceEpoch
    });
  }

  static Future<List<Transactions>> getTransactions(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.get();
    var documents =
        snapshot.docs.where((doc) => doc.data()['userID'] == userID);

    return documents
        .map((e) => Transactions(
            userID: e.data()['userID'],
            title: e.data()['title'],
            subtitle: e.data()['subtitle'],
            time: DateTime.fromMillisecondsSinceEpoch(
              e.data()['time'],
            ),
            amount: e.data()['amount'],
            picture: e.data()['picture']))
        .toList();
  }
}
