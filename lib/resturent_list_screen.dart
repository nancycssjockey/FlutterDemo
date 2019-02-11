import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/resturent_list_model.dart';
import 'package:flutter_app/resturant_detail_screen.dart';
import 'package:http/http.dart' as http;

class ResturantListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ResturantListScreen> {
  bool _loading = true;
  List<ResturantModel> _resturentList = <ResturantModel>[];
  List data;
  final String url = "https://swapi.co/api/starships";

  Future<String> getSWData() async {
    var res = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"},
    );
    if(this.mounted)
    setState(() {
      var resBody = json.decode(res.body);
      data = resBody['results'];
      _loading = false;
    });
    return "success";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getSWData();
//    listenForResturants();
  }

  
  listenForResturants() async {
    var streamRes = await getResturantsList();
    streamRes.listen((resturentObj) => setState(() {
          print("successfull");
          _resturentList.add(resturentObj);
        }));
  }

  Future<Stream<ResturantModel>> getResturantsList() async {
    var client = new http.Client();
    var streamRes = await client.send(new http.Request('get', Uri.parse(url)));

    return streamRes.stream
        .transform(UTF8.decoder)
        .transform(JSON.decoder)
        .expand((jsonBody) => (jsonBody as Map)['results'])
        .map((jsonMap) => new ResturantModel.fromJson(jsonMap))
        .listen((data) {
      print("name->>>>" + data.name);
      print("model->>>>" + data.model);
    }).onDone(() => client.close());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("List"),
      ),
      body: 
      Container(
        child: new Stack(
          children: <Widget>[
            new Positioned(
              child: new Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightBlue, Colors.white, Colors.blue],
                        tileMode: TileMode.repeated),
                    shape: BoxShape.circle),
                height: 300.0,
                width: 300.0,
              ),
              top: -50.0,
              left: -70.0,
            ),
            ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(data[index]["name"]);
//                  return ListItem("testing");
                }),
            /*ListView(
              padding: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
              children: _resturentList
                  .map((obj) => ListItem(obj.name.toString())).toList(),
            )*/
            _loading==true?const Align(alignment: Alignment.center,child: CircularProgressIndicator(
              backgroundColor: Colors.green,
              strokeWidth: 6.0,
            ),):Container()
          ],
          
        ),
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final title;

  ListItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Colors.black38,
            style: BorderStyle.solid,
          )),
      margin: EdgeInsets.all(15.0),
      child: InkWell(
          splashColor: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            print("CLicked on list item-> ");
//            Navigator.of(context).pushNamed('/detail');
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new ResturantDetailScreen()));
          },
          child: Stack(
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      RadialGradient(colors: [Colors.black12, Colors.white]),
                ),
                child: new Image.network(
                  "https://i.pinimg.com/564x/e3/82/fd/e382fdf121d808ca3d1cf24e5cd6e9f2.jpg",
                  fit: BoxFit.cover,
                  height: 300.0,
                  width: double.infinity,
                ),
                padding: EdgeInsets.only(top: 130.0),
              ),
              new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 20.0),
                          child: new Icon(
                            Icons.store,
                            color: Colors.grey,
                            size: 30.0,
                          )),
                      Expanded(
                        child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 20.0),
                        child: new Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 0.0, top: 20.0, right: 20.0),
                          child: new Icon(
                            Icons.location_on,
                            color: Colors.grey,
                            size: 30.0,
                          )),
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 60.0, right: 10.0),
                    child: new Text(
                      "Maxican, 18 Tank House Lane Hip spot for Maxican tripas with a patio Open untill 12:00 AM",
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
