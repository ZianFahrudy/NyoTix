part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetails movie;
  SelectSchedulePage(this.movie);
  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  Theater selectedTheater;
  int selectSchedule;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMovieDetailPage(widget.movie));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(color: accentColor1),
            SafeArea(
              child: Container(color: Colors.white),
            ),
            ListView(children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultmargin, 20, defaultmargin, 0),
                      child: GestureDetector(
                          onTap: () {
                            context
                                .bloc<PageBloc>()
                                .add(GoToMovieDetailPage(widget.movie));
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black)))),
              Container(
                margin:
                    EdgeInsets.fromLTRB(defaultmargin, 20, defaultmargin, 20),
                child: Text("Select Your\nFavorite Genre",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultmargin : 0,
                            right: (index < dates.length - 1)
                                ? 16
                                : defaultmargin),
                        child: DateCard(
                          dates[index],
                          isSelected: selectedDate == dates[index],
                          onTap: () {
                            setState(() {
                              selectedDate = dates[index];
                            });
                          },
                        ),
                      );
                    }),
              ),
              generateSelectDate(),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => FloatingActionButton(
                    elevation: 0,
                    backgroundColor: isValid ? mainColor : Color(0xFFE4E4E4),
                    child: Icon(Icons.arrow_forward,
                        color: isValid ? Colors.white : Color(0xFFBEBEBE)),
                    onPressed: () {
                      context.bloc<PageBloc>().add(GoToSelectSeatsPage(Tickets(
                          widget.movie,
                          randomAlphaNumeric(12).toUpperCase(),
                          null,
                          selectedTheater,
                          (userState as UserLoaded).user.name,
                          DateTime(selectedDate.year, selectedDate.month,
                              selectedDate.day, selectSchedule),
                          null)));
                    }),
              ),
              SizedBox(height: 50),
            ]),
          ],
        ),
      ),
    );
  }

  Column generateSelectDate() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];
    for (var theater in dummyTheaters) {
      widgets.add(Container(
        margin: EdgeInsets.fromLTRB(defaultmargin, 24, defaultmargin, 16),
        child: Text(
          theater.name,
          style:
              blackTextFont.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ));
      widgets.add(Container(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: schedule.length,
            itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultmargin : 0,
                      right:
                          (index != schedule.length - 1) ? 16 : defaultmargin),
                  child: SelectableBox(
                    "${schedule[index]}:20",
                    isSelected: selectedTheater == theater &&
                        selectSchedule == schedule[index],
                    isEnabled: schedule[index] > DateTime.now().hour ||
                        selectedDate.day != DateTime.now().day,
                    height: 50,
                    onTap: () {
                      setState(() {
                        selectedTheater = theater;
                        selectSchedule = schedule[index];
                        isValid = true;
                      });
                    },
                  ),
                )),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
