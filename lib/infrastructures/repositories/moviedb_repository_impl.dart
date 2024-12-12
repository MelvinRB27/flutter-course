import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviedbRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDatasource;
  MoviedbRepositoryImpl(this.moviesDatasource);

  @override
  Future<List<Movie>> getNowPlaying() async {
    return await moviesDatasource.getNowPlaying();
  }
}
