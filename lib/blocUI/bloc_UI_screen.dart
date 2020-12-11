import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gridUpwork/bloc/griddata_bloc.dart';
import 'package:gridUpwork/grid/grid_tile.dart';
import 'package:gridUpwork/models/grid_data_model.dart';

class BlocUIScreen extends StatefulWidget {
  @override
  _BlocUIScreenState createState() => _BlocUIScreenState();
}

class _BlocUIScreenState extends State<BlocUIScreen> {
  final List<Data> dataList = [];
  bool seeAll1 = false;
  bool seeAll2 = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<GriddataBloc, GriddataState>(
        listener: (context, state) {
          if (state is GriddataLoading) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("Loading")));
          } else if (state is GriddataSuccess) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("Success")));
          } else if (state is GriddataError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Error")));
          }
        },
        builder: (context, state) {
          if (state is GriddataLoading ||
              state is GriddataInitial && dataList.isEmpty) {
            return CircularProgressIndicator();
          } else if (state is GriddataSuccess) {
            dataList.addAll(state.dataList);
          }
          return ListView(
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
                                    fontSize: 19, fontWeight: FontWeight.w400)),
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
                                    fontSize: 19, fontWeight: FontWeight.w400)),
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
                  List<Data> header1List = dataList
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
                                    fontSize: 19, fontWeight: FontWeight.w400)),
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
                                    fontSize: 19, fontWeight: FontWeight.w400)),
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
                  List<Data> header2List = dataList
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
              // RaisedButton(
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => DummyScreen(),
              //     ));
              //   },
              //   child: Text("Navigate to Dummy"),
              // )
            ],
          );
        },
      ),
    );
  }
}
