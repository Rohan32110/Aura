import 'package:flutter/material.dart';
import 'package:aura/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "Weather",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Info in any cities",
                            style: kInfoTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 11.0),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF676768),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextField(
                                style: const TextStyle(
                                    color: Colors.black, fontFamily: 'Ubuntu'),
                                cursorColor: Colors.black,
                                cursorRadius: const Radius.circular(15),
                                decoration: kInputDecoration,
                                onChanged: (value) {
                                  cityName = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(0.0),
                              padding: const WidgetStatePropertyAll(
                                  EdgeInsets.only(
                                      top: 11.0,
                                      bottom: 11.0,
                                      left: 15,
                                      right: 15)),
                              backgroundColor: const WidgetStatePropertyAll(
                                  kLoadingScrnColor),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.pop(context, cityName);
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
                      SizedBox(height: 9.0),
                    ],
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
