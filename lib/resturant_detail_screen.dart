import 'package:flutter/material.dart';


class ResturantDetailScreen extends StatefulWidget {

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<ResturantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ItemViewPager();
  }

  @override
  void initState() {
    super.initState();
  }
}

class ItemViewPager extends StatefulWidget {
  @override
  _ItemViewPagerState createState() => _ItemViewPagerState();
}

class _ItemViewPagerState extends State<ItemViewPager> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: TabBarView(
          children: <Widget>[
            DetailItem(0),
            DetailItem(1),
            DetailItem(2),
            DetailItem(3),
          ],
        ));
  }
}

class DetailItem extends StatelessWidget {
  final int index;

  DetailItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Image.network(
              "https://i.pinimg.com/564x/e3/82/fd/e382fdf121d808ca3d1cf24e5cd6e9f2.jpg",
              fit: BoxFit.cover,
              height: 300.0,
              width: double.infinity,
            ),
            Positioned(
              top: 250.0,
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
              child: DefaultTabController(
                  length: 3,
                  child: TabBarView(
                    children: <Widget>[
                      BodyContent(),
                      BodyContent(),
                      BodyContent(),
                    ],
                  )),
            ),
          ],
        ));
  }
}

/**
 * Body Content
 */
class BodyContent extends StatefulWidget {
  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0)),
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Theme.of(context).textSelectionColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0)),
              indicatorWeight: 4.0,
              tabs: <Widget>[
                Text(
                  "DETAILS",
                ),
                Text(
                  "MENU",
                ),
                Text(
                  "REVIEWS",
                ),
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                      child: Text("Pickle Jam and Chutny",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, top: 30.0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      mini: true,
                      child: Icon(Icons.add_location),
                      elevation: 6.0,
                      tooltip: "Location",
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Text(
                  "I have a collection of food props and noticed that I have disappropriate number of bowls as compared to plates,"
                      "Bowls makes me happy. This was shot on a white table cloth in my studio with natural light from a south facing window and some additional light from my westcott 2 x 2 "
                      "flex mat LED light at 30% brightness.",
                  style: TextStyle(fontSize: 14.0,),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            getFloatingActionBtn(
                                "time", Icons.access_time, Colors.deepPurple),
                            getFloatingText("10am - 10pm"),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          getFloatingActionBtn(
                              "gps", Icons.gps_fixed, Colors.green),
                          getFloatingText("1.5 km"),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          getFloatingActionBtn("map", Icons.map, Colors.blue),
                          getFloatingText("Map View"),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          getFloatingActionBtn(
                              "store", Icons.store, Colors.green),
                          getFloatingText("Delivery"),
                        ],
                      )),
                    ],
                  )),
            ],
          ),
        ));
  }

  /**
   * Floating Action Button
   */
  FloatingActionButton getFloatingActionBtn(
      String heroTag, IconData icon, MaterialColor color) {
    return FloatingActionButton(
      onPressed: () {},
      heroTag: heroTag,
      shape: CircleBorder(side: BorderSide(color: Colors.grey)),
      backgroundColor: Colors.white,
      mini: true,
      child: Icon(
        icon,
        color: color,
      ),
      elevation: 6.0,
    );
  }

  Padding getFloatingText(String text) {
    return Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 10.0,),
        ));
  }
}
