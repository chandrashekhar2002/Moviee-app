import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviee/core/colors.dart';
import 'package:moviee/feature/presentation/dashboard/movie_dashboard.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';
import 'package:moviee/feature/presentation/user_onboarding/sliding_movies.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: _continueBtn(context, ref),
      backgroundColor: appBackGroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: const MoviesSlider(),
    );
  }

  Widget _continueBtn(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RawMaterialButton(
        onPressed: () async {
          await ref.read(nowPlayingProvider.notifier).getNowPlaying();
          final value =
              await ref.read(trendingMoviesProvider.notifier).getMovies();
          if (!value) {
            return;
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MoviesDashboard(),
              ));
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const UserNameScreen(),
          //     ));
        },
        elevation: 2.0,
        fillColor: Colors.white,
        constraints: const BoxConstraints(minWidth: 0.0),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
        child: ref.watch(calledMoviesApi) == false
            ? const CircularProgressIndicator(backgroundColor: Colors.grey)
            : const Icon(
                Icons.navigate_next_outlined,
                size: 35.0,
              ),
      ),
    );
  }
}
