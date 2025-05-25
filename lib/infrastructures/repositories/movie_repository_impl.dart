import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDatasource;
  MovieRepositoryImpl(this.moviesDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
  return await moviesDatasource.getNowPlaying(page: page);
  }

  Future<List<Movie>> upComing({int page = 1}) async {
    return await moviesDatasource.upComing(page: page);
  }

  Future<List<Movie>> getPopular({int page = 1}) async {
    return await moviesDatasource.getPopular(page: page);
  }
  
  Future<List<Movie>> getTopRated({int page = 1}) async {
    return await moviesDatasource.getTopRated(page: page);
  }

}
