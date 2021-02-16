part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    'Horror',
    'Music',
    'Action',
    'Drama',
    'War',
    'Crime'
  ];
  final List<String> language = ['Bahasa', 'English', 'Japanese', 'Korean'];
  final RegistrationData registrationData;

  PreferencePage(this.registrationData);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenre = [];
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationData.password = "";

        context
            .bloc<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultmargin),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: GestureDetector(
                        onTap: () {
                          widget.registrationData.password = "";

                          context.bloc<PageBloc>().add(
                              GoToRegistrationPage(widget.registrationData));
                        },
                        child: Icon(Icons.arrow_back)),
                  ),
                  Text("Select Your\nFavorite Genre",
                      style: blackTextFont.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateGenreWidgets(context),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24, bottom: 16),
                    child: Text("Movie Language\nYou Prefer?",
                        style: blackTextFont.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateLangWidgets(context)),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: mainColor,
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (selectedGenre.length != 4) {
                            Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Colors.pink,
                                message: "Pilih dulu 4 genre",
                                duration: Duration(
                                  milliseconds: 1500,
                                )).show(context);
                          } else {
                            widget.registrationData.selectedGenre =
                                selectedGenre;
                            widget.registrationData.selectedLanguage =
                                selectedLanguage;

                            context.bloc<PageBloc>().add(
                                GoToAccountConfirmationPage(
                                    widget.registrationData));
                          }
                        }),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultmargin - 24) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenre.contains(e),
              onTap: () {
                onSelectedGenre(e);
              },
            ))
        .toList();
  }

  List<Widget> generateLangWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultmargin - 24) / 2;

    return widget.language
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLanguage == e,
              onTap: () {
                setState(() {
                  selectedLanguage = e;
                });
              },
            ))
        .toList();
  }

  void onSelectedGenre(String genre) {
    if (selectedGenre.contains(genre)) {
      setState(() {
        selectedGenre.remove(genre);
      });
    } else {
      if (selectedGenre.length < 4) {
        setState(() {
          selectedGenre.add(genre);
        });
      }
    }
  }
}
