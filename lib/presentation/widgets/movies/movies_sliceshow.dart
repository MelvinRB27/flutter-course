import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSliceshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSliceshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: Swiper(
          viewportFraction: 0.8,
          scale: 0.9,
          autoplay: true,
          pagination: SwiperPagination(
              margin: const EdgeInsets.only(bottom: 0),
              builder:
                  DotSwiperPaginationBuilder(activeColor: colors.secondary)),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return _Slice(movie: movies[index]);
          },
        ));
  }
}

class _Slice extends StatelessWidget {
  final Movie movie;
  const _Slice({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            offset: Offset(0, 10),
          )
        ]);

    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return FadeIn(child: child);
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                );
              },
            ),
          ),
        ));
  }
}
