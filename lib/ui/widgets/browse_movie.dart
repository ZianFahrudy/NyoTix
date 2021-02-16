part of 'widgets.dart';

class BrowseMovie extends StatelessWidget {
  final String genre;

  BrowseMovie(this.genre);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(getImageFromGenre(genre)),
                  fit: BoxFit.cover)),
        ),
        Text(genre),
      ],
    );
  }

  String getImageFromGenre(String genre) {
    switch (genre) {
      case "Horror":
        return "assets/ic_horror.png";
        break;
      case "Action":
        return "assets/ic_action.png";
        break;
      case "Crime":
        return "assets/ic_crime.png";
        break;
      case "Drama":
        return "assets/ic_drama.png";
        break;
      case "Music":
        return "assets/ic_music.png";
        break;
      case "War":
        return "assets/ic_war.png";
        break;
      default:
        return "";
    }
  }
}
