part of 'pages.dart';

class SelectSeatsPage extends StatefulWidget {
  final Tickets tickets;

  SelectSeatsPage(this.tickets);
  @override
  _SelectSeatsPageState createState() => _SelectSeatsPageState();
}

class _SelectSeatsPageState extends State<SelectSeatsPage> {
  List<String> selectedSeats = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToSelectSchedulePage(widget.tickets.movieDetails));
          return;
        },
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(
              color: accentColor1,
            ),
            SafeArea(child: Container(color: Colors.white)),
            ListView(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 20, left: defaultmargin),
                        child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoToSelectSchedulePage(
                                      widget.tickets.movieDetails));
                            },
                            child: Icon(Icons.arrow_back))),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: defaultmargin),
                      child: Row(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(widget.tickets.movieDetails.title,
                              textAlign: TextAlign.end,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: blackTextFont.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                        ),
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageBaseUrl +
                                        "w154" +
                                        widget.tickets.movieDetails
                                            .posterPath)))),
                      ]),
                    ),
                  ],
                ),
                Container(
                  height: 84,
                  width: 277,
                  margin: EdgeInsets.only(top: 30),
                  child: Image.asset("assets/screen.png"),
                ),
                generateSeats(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                      right: defaultmargin + 50, left: defaultmargin + 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Color(0xFFE4E4E4))),
                          ),
                          SizedBox(width: 8),
                          Text("Available",
                              style: greyTextFont.copyWith(fontSize: 10)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Color(0xFFF6F6F6),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Color(0xFFF6F6F6))),
                          ),
                          SizedBox(width: 8),
                          Text("Booked",
                              style: greyTextFont.copyWith(fontSize: 10)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Color(0xFFFBD460),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Color(0xFFFBD460))),
                          ),
                          SizedBox(width: 8),
                          Text("Selected",
                              style: greyTextFont.copyWith(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                FloatingActionButton(
                    elevation: 0,
                    child: Icon(
                      Icons.arrow_forward,
                      color: selectedSeats.length > 0
                          ? Colors.white
                          : Color(0xFFBEBEBE),
                    ),
                    backgroundColor: selectedSeats.length > 0
                        ? mainColor
                        : Color(0xFFE4E4E4),
                    onPressed: selectedSeats.length > 0
                        ? () {
                            context.bloc<PageBloc>().add(GoToCheckOutPage(
                                widget.tickets.copyWith(seats: selectedSeats)));
                          }
                        : null)
              ],
            )
          ],
        )));
  }

  Column generateSeats() {
    List<int> numberofSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (var i = 0; i < numberofSeats.length; i++) {
      widgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              numberofSeats[i],
              (index) => Container(
                  margin: EdgeInsets.only(
                      bottom: 16,
                      right: (index < numberofSeats[i] - 1) ? 16 : 0),
                  child: SelectableBox(
                      "${String.fromCharCode(i + 65)}${index + 1}",
                      isSelected: selectedSeats.contains(
                          "${String.fromCharCode(i + 65)}${index + 1}"),
                      isEnabled: index != 0,
                      height: 40, onTap: () {
                    String seatNumber =
                        "${String.fromCharCode(i + 65)}${index + 1}";

                    setState(() {
                      if (selectedSeats.contains(seatNumber)) {
                        selectedSeats.remove(seatNumber);
                      } else {
                        selectedSeats.add(seatNumber);
                      }
                    });
                  }, width: 40)))));
    }
    return Column(children: widgets);
  }
}
