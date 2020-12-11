import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gridUpwork/grid/dummy_screen.dart';
import 'package:gridUpwork/grid/grid_tile.dart';
import 'package:gridUpwork/models/grid_data_model.dart';
import 'package:gridUpwork/sample.dart';
import 'package:provider/provider.dart';

import '../counter.dart';

class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  bool seeAll1 = false;
  bool seeAll2 = false;
  List<Data> gd = List<Data>();
  getData() async {
    GridData g = GridData();
    gd = await g.getGridDataList();
    //print("gd GetData======" + gd.toString());
  }

  getDataFromProvider(BuildContext context) async {
    gd = Provider.of<List<Data>>(context, listen: true);
    print("gd getData from provider : " + gd.toString());
  }

  @override
  Widget build(BuildContext context) {
    //List<Data> gd = Provider.of(context);

    // print(context.watch<List<Data>>().toString());
    //getData();

    //getDataFromProvider(context);
    //print("gd grid screen====" + gd.toString());
    gd = Provider.of<List<Data>>(context);
    print("gd getData from provider : " + gd.toString());
    print("count= ${NetworkCallsCounter.count}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: gd == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.notifications_none_rounded,
                        size: 35,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Header 1",
                            style: GoogleFonts.openSans(
                                fontSize: 23, fontWeight: FontWeight.w900)),
                      ),
                      seeAll1
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FlatButton(
                                child: Text("See less",
                                    style: GoogleFonts.openSans(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400)),
                                onPressed: () {
                                  setState(() {
                                    seeAll1 = false;
                                  });
                                },
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FlatButton(
                                child: Text("See all",
                                    style: GoogleFonts.openSans(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400)),
                                onPressed: () {
                                  setState(() {
                                    seeAll1 = true;
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    itemCount: seeAll1 ? 4 : 2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      // print("gd====" + gd.toString());
                      List<Data> header1List = gd
                          .where((element) => element.type == "header 1")
                          .toList();
                      return CustomGridTile(
                        data: header1List[index],
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Header 2",
                            style: GoogleFonts.openSans(
                                fontSize: 23, fontWeight: FontWeight.w900)),
                      ),
                      seeAll2
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FlatButton(
                                child: Text("See less",
                                    style: GoogleFonts.openSans(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400)),
                                onPressed: () {
                                  setState(() {
                                    seeAll2 = false;
                                  });
                                },
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FlatButton(
                                child: Text("See all",
                                    style: GoogleFonts.openSans(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400)),
                                onPressed: () {
                                  setState(() {
                                    seeAll2 = true;
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    itemCount: seeAll2 ? 4 : 2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      List<Data> header2List = gd
                          .where((element) => element.type == "header 2")
                          .toList();
                      //print("gd====" + gd.toString());
                      return CustomGridTile(
                        data: header2List[index],
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DummyScreen(),
                      ));
                    },
                    child: Text("Navigate to Dummy"),
                  )
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.lightbulb_outline_rounded,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.person_outline_rounded,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
