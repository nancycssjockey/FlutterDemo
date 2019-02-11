import 'package:flutter/material.dart';

class WeatherDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB46Kj6gcx_fSzbzFskIPfME-Sn_yuqf9eAW3lsvVqupsyI6RE",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,),
          //Text Content over Background
            
        ],
    );
  }

}