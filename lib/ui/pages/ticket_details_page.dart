part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Tickets tickets;
  TicketDetailPage(this.tickets);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(color: accentColor1),
            SafeArea(child: Container(color: Color(0xFFE5E5E5))),
            // NOTE: BACK BUTTON
            ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: defaultmargin, top: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.arrow_back)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("Ticket Details",
                                style: blackTextFont.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))))
                  ],
                ),
                SizedBox(height: 20),
                Container(
                    height: 530,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: defaultmargin,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            height: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageBaseUrl +
                                        "w500" +
                                        tickets.movieDetails.backdropPath)))),
                        SizedBox(height: 16),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(tickets.movieDetails.title,
                                      style: blackTextFont.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        tickets.movieDetails.genreAndLanguage,
                                        style: greyTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                  RatingStars(
                                    starSize: 15,
                                    fontSize: 15,
                                    voteAverage:
                                        tickets.movieDetails.voteAverage,
                                    alignment: MainAxisAlignment.start,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Cinema",
                                            style: greyTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                        Text(tickets.theater.name,
                                            style: blackTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Date & Time",
                                            style: greyTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                        Text(tickets.time.dateAndTime,
                                            style: blackTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Seats Number",
                                            style: greyTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                        Text(tickets.seatsInString,
                                            style: blackTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("ID Order",
                                            style: greyTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                        Text(tickets.bookingCode,
                                            style: blackTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  generateTitik(
                                      (MediaQuery.of(context).size.width -
                                          2 * defaultmargin -
                                          40)),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Name"),
                                          Text(tickets.name),
                                          Text("Paid"),
                                          Text(NumberFormat.currency(
                                                  symbol: "Rp. ",
                                                  locale: "id_ID",
                                                  decimalDigits: 0)
                                              .format(tickets.totalPrice))
                                        ],
                                      ),
                                      QrImage(
                                          backgroundColor: Colors.white,
                                          size: 100,
                                          data: tickets.bookingCode),
                                    ],
                                  )
                                ])),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
