import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MoviesSlider extends StatefulWidget {
  const MoviesSlider({Key? key}) : super(key: key);

  @override
  State<MoviesSlider> createState() => _MoviesSliderState();
}

class _MoviesSliderState extends State<MoviesSlider> {
  int activeIndex = 0;
  final controller = CarouselSliderController();
  final urlImages =[
    "/ombsmhYUqR4qqOLOxAyr5V8hbyv.jpg",
    "/hqcexYHbiTBfDIdDWxrxPtVndBX.jpg",
    "/1WP2MrTIXJ8NI5tvqBk4ZD4ju9O.jpg",
    "/khohu1IKmgGNvETjEaxZaWBw4fr.jpg",
    "/2VUmvqsHb6cEtdfscEA6fqqVzLg.jpg",
    "/lXAyZHGAh0YrAi8x7ekCnoquace.jpg",
    "/1QdXdRYfktUSONkl1oD5gc6Be0s.jpg",
    "/wqfu3bPLJaEWJVk3QOm0rKhxf1A.jpg",
    "/r0td1J4kALobMwjPKLGe7RwJ07o.jpg",
    "/A6mxBwvvv63JXZm3xXKv4SugE0L.jpg",
    "/lVgE5oLzf7ABmzyASEVcjYyHI41.jpg",
    "/yqsCU5XOP2mkbFamzAqbqntmfav.jpg",
    "/vqBmyAj0Xm9LnS1xe1MSlMAJyHq.jpg",
    "/tObSf1VzzHt9xB0csanFtb3DRjf.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = 'https://image.tmdb.org/t/p/original/${urlImages[index]}';
              return buildImage(urlImage);
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(child: buildIndicator()),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage) => SizedBox(
    width: double.infinity,
    child: CachedNetworkImage(
      imageUrl: urlImage,
      fit: BoxFit.cover,
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    effect: const ExpandingDotsEffect(
      dotWidth: 5,
      dotHeight: 5,
      activeDotColor: Colors.black,
      dotColor: Colors.grey,
    ),
    activeIndex: activeIndex,
    count: urlImages.length
  );

  void animateToSlide(int index) => controller.animateToPage(index);
}
