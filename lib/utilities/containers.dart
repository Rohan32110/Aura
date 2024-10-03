import 'package:flutter/material.dart';
import 'package:aura/utilities/constants.dart';

class MainContainer extends StatelessWidget {
  final int tempInt;
  final String city;
  final String country;
  final String images;

  const MainContainer({
    super.key,
    required this.tempInt,
    required this.city,
    required this.country,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kMargin,
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images),
          fit: BoxFit.cover,
        ),
        color: const Color(0xFFCED6DF),
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 13.0, top: 8, bottom: 1.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF262929).withOpacity(.5),
              const Color(0xFF4D4D50).withOpacity(.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Now",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "$tempInt°C",
              style: kTempStyle,
            ),
            const SizedBox(
              height: 23,
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  country,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SmallContainer extends StatelessWidget {
  final String iconImage;
  final String texts;

  SmallContainer({
    required this.iconImage,
    required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      height: 135,
      width: double.infinity,
      decoration: kBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            iconImage,
            scale: 0.9,
          ),
          Text(
            texts,
            style: const TextStyle(
              fontSize: 13,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              color: Color(0xFF4E4E4E),
            ),
          ),
        ],
      ),
    );
  }
}

class IconTextInfoDesign extends StatelessWidget {
  const IconTextInfoDesign({
    super.key,
    required this.images,
    required this.texts,
    required this.infos,
  });

  final String images;
  final String texts;
  final String infos;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(images,
            width: 40, height: 40, fit: BoxFit.cover), // Local image
        Text(
          texts,
          style: kUnderTextStyle,
        ),
        Text(
          '$infos ',
          style: kInfoTextStyle,
        ),
      ],
    );
  }
}
