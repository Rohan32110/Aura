import 'package:aura/screens/load_small.dart';
import 'package:flutter/material.dart';
import 'package:aura/utilities/containers.dart';
import 'package:aura/services/weather.dart';
import 'package:aura/utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void showAlert(
      {required AlertType alertTypes,
      required String titles,
      required String descs,
      required String btnTexts}) {
    Alert(
      style: kAlertStyle,
      context: context,
      type: alertTypes,
      title: titles,
      desc: descs,
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          color: kLocationScrnColor,
          child: Text(
            btnTexts,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
    return;
  }

  String? cityName;
  WeatherModel weatherModel = WeatherModel();

  double? temperature;
  int? tempInt;
  double? feelsLike;
  int? feelsTemp;
  int? humidity;
  double? windSpeed;
  String? city;
  String? country;
  String? weatherDescription;
  String? main;
  String? iconId;
  int? wind;
  double? lat;
  double? long;
  String? longString;
  String? latString;
  int? imageId;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) async {
    if (weatherData == null) {
      showAlert(
          alertTypes: AlertType.info,
          titles: "No Data",
          descs: "No weather data found.",
          btnTexts: "OK");
      return;
    }

    try {
      setState(() {
        temperature = weatherData['main']['temp'] ?? 0.0;
        tempInt = temperature?.toInt();
        feelsLike = weatherData['main']['feels_like'] ?? 0.0;
        feelsTemp = feelsLike?.toInt();
        humidity = weatherData['main']['humidity'] ?? 0;
        windSpeed = weatherData['wind']['speed'] ?? 0.0;
        wind = windSpeed?.toInt();
        city = weatherData['name'] ?? 'Unknown';
        country = weatherData['sys']['country'] ?? 'Unknown';
        weatherDescription = weatherData['weather']?.isNotEmpty == true
            ? weatherData['weather'][0]['description'] ?? 'Not available'
            : 'Not available';
        main = weatherData['weather']?.isNotEmpty == true
            ? weatherData['weather'][0]['main'] ?? 'Unknown'
            : 'Unknown';
        lat = weatherData['coord']['lat'] ?? 0.0;
        latString = lat?.toStringAsFixed(2) ?? '0.00';
        long = weatherData['coord']['lon'] ?? 0.0;
        longString = long?.toStringAsFixed(2) ?? '0.00';
        iconId = weatherData['weather']?.isNotEmpty == true
            ? weatherData['weather'][0]['icon'] ?? '01d'
            : '01d';
        imageId = weatherData['weather']?.isNotEmpty == true
            ? weatherData['weather'][0]['id'] ?? 701
            : 701;
      });
    } catch (e) {
      showAlert(
          alertTypes: AlertType.info,
          titles: "Issue Found",
          descs:
              "Couldn't get data for some issue. Please check Network availability.",
          btnTexts: "Retry");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: kLocationScrnColor,
          title: const Text(
            "A U R A",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
              fontSize: 21,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF668EA3),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                margin: kMargin,
                padding: kPadding,
                width: double.infinity,
                height: 54,
                decoration: kBoxDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: const TextStyle(
                                color: Colors.black, fontFamily: 'Ubuntu'),
                            cursorColor: const Color(0xFF03A8FF),
                            cursorWidth: 2.5,
                            cursorRadius: const Radius.circular(9),
                            decoration: kInputDecoration,
                            onChanged: (value) {
                              cityName = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: const WidgetStatePropertyAll(0.0),
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.only(
                                  top: 1.0, bottom: 1.0, left: 15, right: 15),
                            ),
                            backgroundColor:
                                const WidgetStatePropertyAll(kLoadingScrnColor),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (cityName == null ||
                                (cityName?.isEmpty ?? true)) {
                              showAlert(
                                  alertTypes: AlertType.error,
                                  titles: "Error",
                                  descs: "Please enter a valid city name.",
                                  btnTexts: "OK");
                              return;
                            }

                            var weatherData = await weatherModel
                                .getCityWeather(cityName ?? 'Unknown');

                            if (weatherData == null) {
                              showAlert(
                                  alertTypes: AlertType.error,
                                  titles: "City Not Found",
                                  descs:
                                      "The city name you entered is incorrect. Please try again.",
                                  btnTexts: "Retry");
                            } else {
                              updateUI(weatherData);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LocationScreen(
                                        locationWeather: weatherData);
                                  },
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  MainContainer(
                    tempInt: tempInt ?? 0,
                    city: city ?? 'Unknown',
                    country: country ?? 'BD',
                    images: weatherModel.getWeatherImage(imageId ?? 701),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          padding: EdgeInsets.all(5),
                          height: 135,
                          decoration: kBoxDecoration,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('images/location.png',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover), // Local image
                              Text(
                                'latitude   :$latString\nlongitude:$longString',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: kBrownTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SmallContainer(
                              iconImage: WeatherModel()
                                  .getWeatherIcon(iconId ?? '50d'),
                              texts: weatherDescription ?? 'Not available',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: kMargin,
                    padding: EdgeInsets.all(10),
                    height: 135,
                    decoration: kBoxDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconTextInfoDesign(
                          images: 'images/feelsLike.png',
                          texts: 'Feels like',
                          infos: '$feelsTemp°C',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconTextInfoDesign(
                          images: 'images/humidity.png',
                          texts: 'Humidity',
                          infos: '$humidity%',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconTextInfoDesign(
                          images: 'images/wind.png',
                          texts: 'Wind Flow',
                          infos: '$wind km/h',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 115,
                    width: double.infinity,
                    margin: kMargin,
                    padding: kPadding,
                    decoration: kBoxDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset('images/star.png'),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              weatherModel.getAdvice(iconId ?? '01d'),
                              style: kUnderTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 56,
                    width: double.infinity,
                    margin: kMargin,
                    padding: kPadding,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF49BAFB),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoadSmall();
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          "Check Weather Now",
                          style: kUnderTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: kContainerMargin,
                    height: 245,
                    width: double.infinity,
                    decoration: kBoxDecoration,
                    child: Container(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                          weatherModel.getNiceImage(iconId ?? '01d'),
                        ),
                        fit: BoxFit.fill,
                      ),
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
