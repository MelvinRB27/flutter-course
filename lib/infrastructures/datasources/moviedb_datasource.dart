import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/infrastructures/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructures/models/moviedb/moviedb_reponse.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieDBDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: "https://api.themoviedb.org/3/", queryParameters: {
      "api_key": Environment.movieDbKey,
      "language": "en-MX",
    }),
  );

  @override
  Future<List<Movie>> getNowPlaying() async {
    final response = await dio.get('/movie/now_playing');

    final movieResponse = MovieDbResponse.fromJson(response.data);

    List<Movie> movies = movieResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
