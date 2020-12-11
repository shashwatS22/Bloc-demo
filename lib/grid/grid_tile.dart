import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gridUpwork/models/grid_data_model.dart';

class CustomGridTile extends StatelessWidget {
  final Data data;
  CustomGridTile({this.data});
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(data.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.01,
                    top: MediaQuery.of(context).size.width * 0.01,
                    child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black87,
                            border: Border.all(
                              width: 2,
                              color: Colors.black87,
                            )),
                        child: Icon(
                          Icons.star_border,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(data.title,
                    style: GoogleFonts.openSans(
                        fontSize: 19, fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text("Sample Description",
                      style: GoogleFonts.openSans(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
