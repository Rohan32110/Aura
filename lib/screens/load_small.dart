import 'package:aura/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:aura/services/weather.dart';

class LoadSmall extends StatefulWidget {
  const LoadSmall({super.key});

  @override
  State<LoadSmall> createState() => _LoadSmallState();
}

class _LoadSmallState extends State<LoadSmall> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getCurrentLocationWeather();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF49BAFB),
      body: Center(
        child: LoadingAnimationWidget.halfTriangleDot(
          color: Colors.white,
          size: 65,
        ),
      ),
    );
  }
}
