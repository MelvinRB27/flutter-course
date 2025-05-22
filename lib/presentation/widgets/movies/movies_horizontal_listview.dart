import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _Title(title: title, subtitle: subtitle),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              if (index == movies.length - 1 && loadNextPage != null) {
                loadNextPage!();
              }
              return _ListView(movie: movies[index]);
            },
          ))
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final subtitleStyle = Theme.of(context).textTheme.titleMedium;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            title ?? '',
            style: titleStyle,
          ),
          const Spacer(),
          FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: () {},
            child: Text(
              subtitle ?? '',
              style: subtitleStyle,
            ),
          )
        ],
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final Movie movie;
  const _ListView({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.posterPath,
                width: 150,
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
          ),
          const SizedBox(height: 5),

          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              style: textStyle.titleSmall,
            ),
          ),

          Row(
            children: [
              const Icon(Icons.star_half_outlined, color: Colors.amber),
              const SizedBox(width: 5),
              Text(
                movie.voteAverage.toStringAsFixed(1),
                style: textStyle.bodyMedium,
              ),
              const SizedBox(width: 5),
              Text(
                movie.popularity.toString(),
                style: textStyle.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
