part of 'services.dart';

class MovieServices {
  static Future<List<Movie>> getMovie(int page, {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page";

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return [];
    }
    var data = json.decode(response.body);

    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<MovieDetails> getDetails(Movie movie,
      {int movieID, http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieID ?? movie.id}?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await client.get(url);

    var data = json.decode(response.body);

    List genre = (data as Map<String, dynamic>)['genres'];
    String languages;
    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case "jp":
        languages = "Japanese";
        break;
      case "id":
        languages = "Indonesia";
        break;
      case "ko":
        languages = "Korean";
        break;
      case "en":
        languages = "English";
        break;
      default:
    }

    return movieID != null ? MovieDetails(Movie.fromJson(data),
        languages: languages,
        genres: genre
            .map((e) => ((e as Map<String, dynamic>)['name'].toString()))
            .toList()) : MovieDetails(movie,
        languages: languages,
        genres: genre
            .map((e) => ((e as Map<String, dynamic>)['name'].toString()))
            .toList());
  }

  static Future<List<Credits>> getCredits(int movieID,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apiKey";

    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    List cast = (data as Map<String, dynamic>)['cast'];

    return cast
        .map((e) => Credits(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();

    // return ((data as Map<String, dynamic>)['cast'] as List)
    //     .map((e) => Credits(
    //         name: (e as Map<String, dynamic>)['name'],
    //         profilePath: (e as Map<String, dynamic>)['profile_path']))
    //     .take(8)
    //     .toList();
  }
}
