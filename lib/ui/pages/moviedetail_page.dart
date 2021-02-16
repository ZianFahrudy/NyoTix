part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage(this.movie);
  @override
  Widget build(BuildContext context) {
    MovieDetails movieDetails;
    List<Credits> credits;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(color: mainColor),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: <Widget>[
              FutureBuilder(
                  future: MovieServices.getDetails(movie),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      movieDetails = snapshot.data;

                      return Column(
                        children: <Widget>[
                          Stack(children: <Widget>[
                            Container(
                              height: 270,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageBaseUrl +
                                              "w1280" +
                                              movieDetails.backdropPath ??
                                          movieDetails.posterPath),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 270,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(0, 1),
                                      end: Alignment(0, 0.05),
                                      colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0)
                                  ])),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(
                                    defaultmargin, 20, defaultmargin, 0),
                                child: GestureDetector(
                                    onTap: () {
                                      context
                                          .bloc<PageBloc>()
                                          .add(GoToMainPage());
                                    },
                                    child: Icon(Icons.arrow_back,
                                        color: Colors.white)))
                          ]),
                          SizedBox(height: 16),
                          Text(movieDetails.title,
                              textAlign: TextAlign.center,
                              style: blackTextFont.copyWith(
                                  fontSize: 25, fontWeight: FontWeight.w500)),
                          Container(
                            margin: EdgeInsets.only(top: 6, bottom: 6),
                            child: Text(movieDetails.genreAndLanguage,
                                style: greyTextFont.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )),
                          ),
                          RatingStars(
                            alignment: MainAxisAlignment.center,
                            voteAverage: movieDetails.voteAverage,
                            starSize: 20,
                            fontSize: 12,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Text("Cast & Crew",
                                  style: blackTextFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(height: 12),
                          FutureBuilder(
                              future: MovieServices.getCredits(movie.id),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  credits = snapshot.data;

                                  return SizedBox(
                                    height: 120,
                                    child: ListView.builder(
                                        itemCount: credits.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, i) {
                                          return Container(
                                              margin: EdgeInsets.only(
                                                  right:
                                                      (i != credits.length - 1)
                                                          ? 10
                                                          : defaultmargin,
                                                  left: (i == 0)
                                                      ? defaultmargin
                                                      : 0),
                                              child: CreditCard(credits[i]));
                                        }),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              }),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Text("Storyline",
                                  style: blackTextFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                              height: 150,
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Text(movieDetails.overview)),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 45,
                            width: 250,
                            child: RaisedButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text("Continue to Book",
                                    style: whiteTextFont.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                color: mainColor,
                                onPressed: () {
                                  context.bloc<PageBloc>().add(
                                      GoToSelectSchedulePage(movieDetails));
                                }),
                          ),
                          SizedBox(height: 50),
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            ],
          ),
        ],
      )),
    );
  }
}
