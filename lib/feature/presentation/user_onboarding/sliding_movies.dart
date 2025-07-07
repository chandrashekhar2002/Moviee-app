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
  final urlImages = [
    '/wqfu3bPLJaEWJVk3QOm0rKhxf1A.jpg',
    '/sItIskd5xpiE64bBWYwZintkGf3.jpg',
    "/xABhldZaMb6wfCH5oigV333OYnb.jpg",
    "/rthMuZfFv4fqEU4JVbgSW9wQ8rs.jpg",
    "/U0A4zWh6XbJt1jDAPuGqKcu4ga.jpg",
    "/qwOwDHUPCcDRmdQu8dWCzIVMEgu.jpg",
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
