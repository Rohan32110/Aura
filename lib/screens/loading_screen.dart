import 'package:aura/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:aura/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getCurrentLocationWeather();

    Navigator.push(
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LoadingAnimationWidget.halfTriangleDot(
              color: Colors.white,
              size: 41,
            ),
          ),
          Text(
            " U R ",
            style: TextStyle(
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
              fontSize: 43,
              color: Colors.white,
            ),
          ),
          Center(
            child: LoadingAnimationWidget.halfTriangleDot(
              color: Colors.white,
              size: 41,
            ),
          ),
        ],
      ),
    );
  }
}
