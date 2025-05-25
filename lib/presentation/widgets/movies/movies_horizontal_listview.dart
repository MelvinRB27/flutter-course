import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListview extends StatefulWidget {
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
  State<MoviesHorizontalListview> createState() => _MoviesHorizontalListviewState();
}

class _MoviesHorizontalListviewState extends State<MoviesHorizontalListview> {

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if ( widget.loadNextPage == null) return;
      if (_scrollController.position.pixels + 200 == _scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(title: widget.title, subtitle: widget.subtitle),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (context, index) {
              if (index == widget.movies.length - 1 && widget.loadNextPage != null) {
                widget.loadNextPage!();
              }
              return FadeInRight(child: _ListView(movie: widget.movies[index])) ;
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

          if (subtitle != null)
          FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: () {},
            child: Text(
              subtitle ?? '',
              style: subtitleStyle,
            ),
          ),
          
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

    return SizedBox(
      width: 150,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.posterPath,
                width: 150,
                height: 225,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return FadeIn(child: child);
                  return const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                    ),
                    child: SizedBox(width: 150, height: 225), // Tamaño consistente
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
            Text(
              movie.title,
              style: textStyle.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.star_half_outlined, color: Colors.amber, size: 16),
                const SizedBox(width: 5),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: textStyle.bodyMedium,
                ),
                const Spacer(),
                Text(
                  // movie.popularity.toString(),
                  HumanFormats.number(movie.popularity),
                  style: textStyle.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
