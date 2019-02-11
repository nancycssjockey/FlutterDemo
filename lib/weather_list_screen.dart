import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherListScreen extends StatefulWidget {
  @override
  _WeatherListScreenState createState() => _WeatherListScreenState();
}

class _WeatherListScreenState extends State<WeatherListScreen> {
  @override
  Widget build(BuildContext context) {
    Widget listContainer = Container(
      child: ListView(
        children: <Widget>[
          getListItem(
              "https://shawglobalnews.files.wordpress.com/2017/11/final-winter.jpg?quality=70&strip=all&w=720&h=480&crop=1",
              "Manchester",
              "-2"),
          getListItem(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB46Kj6gcx_fSzbzFskIPfME-Sn_yuqf9eAW3lsvVqupsyI6RE",
              "Amsterdam",
              "16"),
          getListItem(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSobtloTHfQ-aqDRIVF12br7sM0ajFSkye0w9mS17XsSqIryGKj",
              "Ganganagar",
              "48")
        ],
        padding: EdgeInsets.only(top: 20.0),
      ),
    );

    return listContainer;
  }

  Card getListItem(String image, String cityName, String temprature) {
    return Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/weather_detail');
          },
          highlightColor: Colors.lightGreen,
          child: Stack(
            children: <Widget>[
              Image.network(
                image,
                width: double.infinity,
                height: 250.0,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.hardLight,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Text(
                          cityName,
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w300,color: Theme.of(context).canvasColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Text(
                          temprature,
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold,color: Theme.of(context).canvasColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 0.0),
                        child: Icon(Icons.hdr_weak,color: Theme.of(context).canvasColor),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
