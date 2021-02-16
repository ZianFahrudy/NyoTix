part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Tickets tickets;
  final Transactions transactions;

  SuccessPage(this.tickets, this.transactions);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return;
        },
        child: Scaffold(
            body: FutureBuilder(
                future: tickets != null
                    ? processingTicketOrder(context)
                    : processingTopUp(context),
                builder: (_, snapshot) => (snapshot.connectionState ==
                        ConnectionState.done)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: tickets == null
                                            ? AssetImage(
                                                "assets/top_up_done.png")
                                            : AssetImage(
                                                "assets/ticket_done.png")))),
                            Text(
                                tickets != null
                                    ? "Happy Watching!"
                                    : "Emmmmm Yummy!",
                                style: blackTextFont.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            SizedBox(height: 16),
                            Text(
                                tickets != null
                                    ? "You have successfully\nbought the ticket"
                                    : "You have successfully\ntop up the wallet",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: greyTextFont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w300)),
                            Container(
                                margin: EdgeInsets.only(top: 70, bottom: 20),
                                height: 45,
                                width: 250,
                                child: RaisedButton(
                                    elevation: 0,
                                    child: Text(
                                        tickets != null
                                            ? "My Ticket"
                                            : "My Wallet",
                                        style: whiteTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    color: mainColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    onPressed: () {})),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Discover New Movie?",
                                    style: greyTextFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .bloc<PageBloc>()
                                        .add(GoToMainPage());
                                  },
                                  child: Text(" Back to Home",
                                      style: purpleTextFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : SpinKitFadingCircle(size: 50, color: mainColor))));
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(tickets.totalPrice));
    context.bloc<TicketBloc>().add(BuyTickets(tickets, transactions.userID));
    await TransactionServices.saveTransactions(transactions);
  }

  Future<void> processingTopUp(BuildContext context) async {
    context.bloc<UserBloc>().add(TopUp(transactions.amount));

    await TransactionServices.saveTransactions(transactions);
  }
}
