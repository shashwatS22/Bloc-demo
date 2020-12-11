import 'package:flutter/material.dart';
import 'package:gridUpwork/blocUI/display_bloc_grid.dart';
import 'package:gridUpwork/grid/grid_screen.dart';
import 'package:gridUpwork/models/grid_data_model.dart';
import 'package:gridUpwork/sample.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoadingData = true;
  GridData gd = GridData();
  List<Data> data = List<Data>();
  getData() async {
    data = await gd.getGridDataList();
    // .whenComplete(() {
    //   isLoadingData = true;
    // });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //printData();
    //getData();
    print("data list :" + data.toString());
    // print(gd.getGridDataList().toString());
    return
        //  Consumer<List<Data>>(
        //   builder: (context, value, child) {
        //MultiProvider(
        // providers: [
        //   FutureProvider.value(value: gd.getGridDataList())
        //   //Provider.value(value: data),
        // ],
        //child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DisplayBlocUi(),
      //),
    );
    //},
    //)
  }
}
