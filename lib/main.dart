import 'package:flutter/material.dart';
import 'package:flutter_app/resturant_detail_screen.dart';
import 'package:flutter_app/resturent_list_screen.dart';
import 'package:flutter_app/weather_detail_screen.dart';
import 'package:flutter_app/weather_list_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: setLightTheme(),
      showPerformanceOverlay: false,
      home: new MyHomePage(title: 'First Flutter'),
      routes: <String, WidgetBuilder>{
        '/restaurant_list': (BuildContext context) => new ResturantListScreen(),
        '/restaurant_detail': (BuildContext context) => new ResturantDetailScreen(),
        '/weather_detail':(BuildContext context)=> WeatherDetailScreen(),
      },
    );
  }

  ThemeData setLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      canvasColor: Colors.white,
      primarySwatch: Colors.deepPurple,
      accentColor: Colors.blue,
      buttonColor: Colors.deepPurple[100],
      accentIconTheme: IconThemeData(color: Colors.white),
      textSelectionColor: Colors.black,
    );
  }

  ThemeData setDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[400],
      primaryColorDark: Colors.grey[800],
      accentColor: Colors.blue,
      buttonColor: Colors.grey[600],
      accentIconTheme: IconThemeData(color: Colors.white),
      textSelectionColor: Colors.white,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: new AppBar(
              title: new Text("Tabs"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.restaurant),
                    text: "Resturant",
                  ),
                  Tab(icon: Icon(Icons.ac_unit), text: "Weather"),
                  Tab(
                    icon: Icon(Icons.account_balance),
                    text: "Random",
                  ),
                  Tab(
                    icon: Icon(Icons.add_a_photo),
                    text: "Camera",
                  ),
                ],
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 4.0,
                indicatorColor: Colors.white,
              ),
            ),
            body: new TabBarView(children: [
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: new Text(
                        "Resturant",
                        style: TextStyle(fontSize: 25.0),
                      )),
                  new Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: new Icon(
                        Icons.restaurant,
                        size: 100.0,
                      )),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: new RaisedButton(
                      onPressed: () {
                        print("Clicked on list button");
                        /*Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new ResturantListScreen();
                          }));*/
                        Navigator.of(context).pushNamed('/restaurant_list');
                      },
                      child: new Text("Check List"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  )
                ],
              ),
              new WeatherListScreen(),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  new Text("Account Balance"),
                  new Icon(
                    Icons.account_balance,
                  )
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  new Text("Add Photo"),
                  new Icon(
                    Icons.add_a_photo,
                  )
                ],
              ),
            ])));
  }
}
