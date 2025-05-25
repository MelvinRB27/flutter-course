import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(initialLoadingProvider);

    if (loading) {
      return FullScreenLoader();
    }

    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title:  CustomAppbar()
          ),
          // title: CustomAppbar(),
          // pinned: true,
          
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              const SizedBox(height: 10),
          
              const Text(
                "Películas en estreno",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
          
              const SizedBox(height: 10),
          
              MoviesSliceshow(movies: moviesSlideshow),
          
              const SizedBox(height: 10),
          
              MoviesHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subtitle: 'Jueves 22',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
          
              MoviesHorizontalListview(
                movies: upComingMovies,
                title: 'Próximamente',
                subtitle: 'En este mes',
                loadNextPage: () {
                  ref.read(upComingMoviesProvider.notifier).loadNextPage();
                },
              ),
          
              const SizedBox(height: 10),
          
              MoviesHorizontalListview(
                movies: popularMovies,
                title: 'Populares',
                loadNextPage: () {
                  ref.read(popularMoviesProvider.notifier).loadNextPage();
                },
              ),
              
              const SizedBox(height: 10),
          
              MoviesHorizontalListview(
                movies: topRatedMovies,
                title: 'Mejor valoradas',
                subtitle: 'Desde siempre',
                loadNextPage: () {
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
              )
          ]);
        }, 
        childCount: 1)),
      ]
      
    );
  }
}
