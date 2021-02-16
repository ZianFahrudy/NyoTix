part of 'pages.dart';

class WalletPage extends StatelessWidget {
  final PageEvent pageEvent;

  WalletPage(this.pageEvent);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: accentColor1),
          SafeArea(child: Container(color: Colors.white)),
          BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) => ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, left: defaultmargin),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(pageEvent);
                              },
                              child: Icon(Icons.arrow_back))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text("My Wallet",
                              style: blackTextFont.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w500))),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultmargin),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Stack(
                          children: <Widget>[
                            Container(
                              child: Column(children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 30),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          )),
                                      SizedBox(width: 5),
                                      Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.yellow,
                                          ))
                                    ],
                                  ),
                                ),
                                Text(
                                    NumberFormat.currency(
                                            locale: "id_ID",
                                            decimalDigits: 0,
                                            symbol: "Rp. ")
                                        .format((userState as UserLoaded)
                                            .user
                                            .balance),
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(children: <Widget>[
                                      Text("Card Holder", style: greyTextFont),
                                      Text((userState as UserLoaded).user.name,
                                          style: whiteTextFont),
                                    ]),
                                    SizedBox(width: 10),
                                    Column(children: <Widget>[
                                      Text("Card ID", style: greyTextFont),
                                      Text(
                                          (userState as UserLoaded)
                                              .user
                                              .id
                                              .substring(0, 7)
                                              .toUpperCase(),
                                          style: whiteTextFont),
                                    ]),
                                  ],
                                )
                              ]),
                              width: double.infinity,
                              height: 185,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(2.7, 0.5))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: mainColor,
                              ),
                            ),
                            ClipPath(
                              clipper: CardClipper(),
                              child: Container(
                                width: double.infinity,
                                height: 185,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                      Colors.white.withOpacity(0.3),
                                      Colors.transparent
                                    ])),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Recent Transactions",
                              style: blackTextFont.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        FutureBuilder(
                            future: TransactionServices.getTransactions(
                                (userState as UserLoaded).user.id),
                            builder: (_, snapshot) {
                              List<Transactions> transactions = snapshot.data;
                              if (snapshot.hasData) {
                                return Column(
                                    children: transactions
                                        .map((e) => TransactionsCard1(
                                              transactions: e,
                                            ))
                                        .toList());
                              } else {
                                return SpinKitFadingCircle(
                                    size: 50, color: mainColor);
                              }
                            }),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 10);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
