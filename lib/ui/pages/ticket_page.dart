part of 'pages.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isExpiredTickets = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        // NOTE: CONTENT
        BlocBuilder<TicketBloc, TicketState>(
            builder: (_, ticketState) => Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultmargin),
                  child: TicketViewer(isExpiredTickets
                      ? ticketState.ticket
                          .where((e) => e.time.isBefore(DateTime.now()))
                          .toList()
                      : ticketState.ticket
                          .where((element) =>
                              !element.time.isBefore(DateTime.now()))
                          .toList()),
                )),
        // NOTE: HEADER
        Container(
          color: accentColor1,
          height: 113,
        ),
        SafeArea(
            child: ClipPath(
          clipper: HeaderClipperrr(),
          child: Container(
            height: 113,
            color: accentColor1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 24, top: 20, bottom: 30),
                      child: Text("My Tickets",
                          style: whiteTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpiredTickets = false;
                                  });
                                },
                                child: Text("Newest",
                                    style: whiteTextFont.copyWith(
                                        color: !isExpiredTickets
                                            ? Colors.white
                                            : Color(0xFF6F678E),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                  height: 4,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: !isExpiredTickets
                                      ? accentColor2
                                      : Colors.transparent),
                            ]),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpiredTickets = true;
                              });
                            },
                            child: Text("Oldest",
                                style: whiteTextFont.copyWith(
                                    color: isExpiredTickets
                                        ? Colors.white
                                        : Color(0xFF6F678E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                              height: 4,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: isExpiredTickets
                                  ? accentColor2
                                  : Colors.transparent)
                        ]),
                      ]),
                ]),
          ),
        )),
      ],
    ));
  }
}

class HeaderClipperrr extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketViewer extends StatelessWidget {
  final List<Tickets> tickets;

  TicketViewer(this.tickets);
  @override
  Widget build(BuildContext context) {
    var shortedTickets = tickets;
    shortedTickets.sort((t1, t2) => t1.time.compareTo(t2.time));

    return ListView.builder(
        shrinkWrap: true,
        itemCount: shortedTickets.length,
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                context
                    .bloc<PageBloc>()
                    .add(GoToTicketDetailPage(shortedTickets[index]));
              },
              child: Container(
                  margin: EdgeInsets.only(top: index == 0 ? 113 : 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 16, top: 20),
                        height: 90,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(imageBaseUrl +
                                    "w500" +
                                    shortedTickets[index]
                                        .movieDetails
                                        .posterPath))),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultmargin -
                            70 -
                            16,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(shortedTickets[index].movieDetails.title,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: blackTextFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            Text(
                                shortedTickets[index]
                                    .movieDetails
                                    .genreAndLanguage,
                                style: greyTextFont.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w300)),
                            Text(shortedTickets[index].theater.name,
                                style: greyTextFont.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w300)),
                          ],
                        ),
                      )
                    ],
                  )),
            ));
  }
}
