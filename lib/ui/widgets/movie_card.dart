part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  MovieCard({this.movie, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 140,
        width: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(imageBaseUrl + "w780" + (movie.backdropPath ?? movie.posterPath)),
                fit: BoxFit.cover)),
        child: Container(
          height: 140,
          width: 210,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.61),
                    Colors.black.withOpacity(0)
                  ])),
          child: Container(
            margin: EdgeInsets.only(left: 13, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: whiteTextFont.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                RatingStars(voteAverage: movie.voteAverage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
