import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moviee/core/colors.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';

class MoviesDashboard extends ConsumerStatefulWidget {
  const MoviesDashboard({super.key});

  @override
  ConsumerState<MoviesDashboard> createState() => _MoviesDashboardState();
}

class _MoviesDashboardState extends ConsumerState<MoviesDashboard> {
  @override
  Widget build(BuildContext context) {
    print('ref.watch(selectedNavIndex) :${ref.watch(selectedNavIndex)}');
    return Scaffold(
      backgroundColor: appBackGroundColor,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 234, 234, 234),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            color: const Color.fromARGB(255, 92, 91, 91),
            activeColor: Colors.white,
            haptic: true,
            gap: 8,
            tabBorderRadius: 25,
            tabBackgroundColor: Color.fromARGB(255, 46, 47, 46),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            selectedIndex: ref.watch(selectedNavIndex),
            tabs: [
              GButton(
                  icon: Icons.local_fire_department_rounded,
                  text: 'Trending',
                  iconSize: 30,
                  onPressed: () =>
                      ref.read(selectedNavIndex.notifier).state = 0),
              GButton(
                  icon: Icons.recommend,
                  text: 'Recommended',
                  iconSize: 30,
                  onPressed: () =>
                      ref.read(selectedNavIndex.notifier).state = 1),
              GButton(
                  icon: Icons.bookmark_add,
                  text: 'BookMarks',
                  iconSize: 30,
                  onPressed: () =>
                      ref.read(selectedNavIndex.notifier).state = 2),
              GButton(
                  icon: Icons.search,
                  text: 'Search Movie',
                  iconSize: 30,
                  onPressed: () =>
                      ref.read(selectedNavIndex.notifier).state = 3),
            ],
          ),
        ),
      ),
      body: ref.read(navigationList)[ref.watch(selectedNavIndex)],
    );
  }
}
