import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructures/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDb) => Movie(
        adult: movieDb.adult,
        backdropPath: movieDb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
            : 'https://cdn11.bigcommerce.com/s-nq6l4syi/images/stencil/608x608/products/32323/2006131/78364-1024__21206.1721148805.jpg?c=2',
        genreIds: movieDb.genreIds.map((id) => id.toString()).toList(),
        id: movieDb.id,
        originalLanguage: movieDb.originalLanguage,
        originalTitle: movieDb.originalTitle,
        overview: movieDb.overview,
        popularity: movieDb.popularity,
        posterPath: movieDb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
            : 'no-poster',
        releaseDate: movieDb.releaseDate,
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
      );
}
