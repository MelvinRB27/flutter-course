import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlatingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlatingMovies.isEmpty) {
    return [];
  }

  return nowPlatingMovies.sublist(0, 7);
});
