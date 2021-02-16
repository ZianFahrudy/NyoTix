part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // NOTE: HEADER
        Container(
            decoration: BoxDecoration(
                color: accentColor1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.fromLTRB(defaultmargin, 20, defaultmargin, 30),
            child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              if (userState is UserLoaded) {
                if (imageToUpload != null) {
                  uploadImage(imageToUpload).then((downloadURL) {
                    imageToUpload = null;

                    context
                        .bloc<UserBloc>()
                        .add(UpdateDataUser(profilePicture: downloadURL));
                  });
                }
                return Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 1, color: Color(0xFF5F558B))),
                      child: Stack(
                        children: <Widget>[
                          SpinKitFadingCircle(
                            size: 50,
                            color: accentColor2,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToProfilePage());
                            },
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: (userState.user.profilePicture ==
                                                ""
                                            ? AssetImage("assets/user_pic.png")
                                            : NetworkImage(
                                                userState.user.profilePicture)),
                                        fit: BoxFit.cover))),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                2 * defaultmargin -
                                78,
                            child: Text(userState.user.name,
                                style: whiteTextFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.clip),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToWalletPage(GoToMainPage()));
                            },
                            child: Text(
                                NumberFormat.currency(
                                        locale: "id_ID",
                                        decimalDigits: 0,
                                        symbol: "IDR ")
                                    .format(userState.user.balance),
                                style: yellowNumberFont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                );
              }
            })),
        // NOTE: NOW PLAYING
        Container(
          margin: EdgeInsets.fromLTRB(defaultmargin, 30, defaultmargin, 12),
          child: Text(
            "Now Playing",
            style: blackTextFont.copyWith(
                fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movie = movieState.movie.sublist(0, 10);

              return ListView.builder(
                  itemCount: movie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          left: (index == 0) ? defaultmargin : 0,
                          right:
                              (index == movie.length - 1) ? defaultmargin : 16),
                      child: MovieCard(
                        onTap: () {
                          context
                              .bloc<PageBloc>()
                              .add(GoToMovieDetailPage(movie[index]));
                        },
                        movie: movie[index],
                      )));
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultmargin, 30, defaultmargin, 12),
          child: Text("Browse Movie",
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
          if (userState is UserLoaded) {
            return Container(
              margin:
                  EdgeInsets.only(left: defaultmargin, right: defaultmargin),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      userState.user.selectedGenre.length,
                      (index) =>
                          BrowseMovie(userState.user.selectedGenre[index]))),
            );
          } else {
            return SpinKitFadingCircle(
              size: 50,
              color: mainColor,
            );
          }
        }),
        Container(
            margin: EdgeInsets.fromLTRB(defaultmargin, 30, defaultmargin, 12),
            child: Text("Coming Soon",
                style: blackTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500))),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movie = movieState.movie.sublist(10);

              return ListView.builder(
                  itemCount: movie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          left: (index == 0) ? defaultmargin : 0,
                          right:
                              (index == movie.length - 1) ? defaultmargin : 16),
                      child: ComingSoonCard(
                        movie: movie[index],
                      )));
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(defaultmargin, 30, defaultmargin, 12),
            child: Text("Get Lucky Day",
                style: blackTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500))),
        Column(
          children: dummyPromos
              .map((e) => Padding(
                    padding: const EdgeInsets.fromLTRB(
                        defaultmargin, 0, defaultmargin, 16),
                    child: PromoCard(e),
                  ))
              .toList(),
        ),
        SizedBox(height: 100)
      ],
    );
  }
}
