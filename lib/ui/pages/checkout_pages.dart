part of 'pages.dart';

class CheckOutPage extends StatefulWidget {
  final Tickets ticket;

  CheckOutPage(this.ticket);
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticket.seats.length;
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSelectSeatsPage(widget.ticket));
          return;
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(color: accentColor1),
              SafeArea(
                  child: Container(
                color: Colors.white,
              )),
              ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: defaultmargin, top: 30),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                context
                                    .bloc<PageBloc>()
                                    .add(GoToSelectSeatsPage(widget.ticket));
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                        UserModels user = (userState as UserLoaded).user;

                        return Column(children: <Widget>[
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text("Checkout\nMovie",
                                  textAlign: TextAlign.center,
                                  style: blackTextFont.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: defaultmargin, right: defaultmargin),
                            child: Row(children: <Widget>[
                              Container(
                                height: 90,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(imageBaseUrl +
                                          "w342" +
                                          widget
                                              .ticket.movieDetails.posterPath)),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultmargin -
                                          90,
                                      child: Text(
                                          widget.ticket.movieDetails.title,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultmargin -
                                          90,
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                          widget.ticket.movieDetails
                                              .genreAndLanguage,
                                          style: greyTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    RatingStars(
                                      voteAverage: widget
                                          .ticket.movieDetails.voteAverage,
                                    ),
                                  ]),
                            ]),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: defaultmargin),
                              child: Divider()),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultmargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("ID Order",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(widget.ticket.bookingCode,
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultmargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Cinema",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text("${widget.ticket.theater.name}",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultmargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Seat Number",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text("${widget.ticket.seatsInString}",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultmargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Date & Time",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(widget.ticket.time.dateAndTime,
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultmargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Price",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    "Rp 25.000 x ${widget.ticket.seats.length}",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultmargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Fee",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text("Rp 1.500 x ${widget.ticket.seats.length}",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultmargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Total",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    NumberFormat.currency(
                                            locale: "id_ID",
                                            symbol: "Rp ",
                                            decimalDigits: 0)
                                        .format(total),
                                    style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: defaultmargin),
                              child: Divider()),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultmargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Your Wallet",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    NumberFormat.currency(
                                            locale: "id_ID",
                                            symbol: "Rp ",
                                            decimalDigits: 0)
                                        .format(user.balance),
                                    style: GoogleFonts.openSans(
                                        color: user.balance > total
                                            ? Color(0xFF3E9D9D)
                                            : Color(0xFFFF5C83),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                          Container(
                              width: 250,
                              height: 45,
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultmargin, vertical: 35),
                              child: RaisedButton(
                                  child: Text(
                                      user.balance > total
                                          ? "Checkout Now"
                                          : "Top Up My Wallet",
                                      style: whiteTextFont.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  color: user.balance > total
                                      ? Color(0xFF3E9D9D)
                                      : Color(0xFF503E9D),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () async {
                                    if (user.balance > total) {
                                      // NOTE: uang cukup
                                      Transactions transactions = Transactions(
                                          userID: user.id,
                                          amount: -total,
                                          picture: widget
                                              .ticket.movieDetails.posterPath,
                                          title:
                                              widget.ticket.movieDetails.title,
                                          subtitle: widget.ticket.theater.name,
                                          time: DateTime.now());

                                      context.bloc<PageBloc>().add(
                                          GoToSuccessPage(
                                              widget.ticket
                                                  .copyWith(totalPrice: total),
                                              transactions));
                                    } else {
                                      // NOTE: uang tidak cukup
                                    }
                                  }))
                        ]);
                      })
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
