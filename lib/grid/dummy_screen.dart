import 'package:flutter/material.dart';
import 'package:gridUpwork/grid/grid_screen.dart';

import '../counter.dart';

class DummyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Network Calls Count  ${NetworkCallsCounter.count}"),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => GridScreen()));
              },
              child: Text("Navigate to home"),
            )
          ],
        ),
      ),
    );
  }
}
