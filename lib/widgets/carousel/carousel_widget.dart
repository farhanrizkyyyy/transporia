import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/theme/theme.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late int _currantPage = 0;
  final double _indicatorSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 42.0),
      child: Column(
        children: [
          CarouselSlider.builder(
            key: IntransporiaKeys.slider,
            itemCount: 3,
            itemBuilder: (_, i, i2) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  child: Image.asset(
                    IntransporiaImages.station,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              onPageChanged: (v, _) => setState(() => _currantPage = v),
              height: 191.0,
              autoPlay: true,
              aspectRatio: 17 / 8,
              enlargeCenterPage: true,
              viewportFraction: 0.64,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (i) => AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 800),
                margin: const EdgeInsets.only(right: 8.0, top: 16.0),
                height: _indicatorSize,
                width: _indicatorSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currantPage == i
                      ? Constants.darkBlue3
                      : Constants.borderBase,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
