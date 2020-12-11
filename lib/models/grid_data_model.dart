import 'package:gridUpwork/counter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GridData {
  Future<List<Data>> getGridDataList() async {
    var response = await http
        .get("https://raw.githubusercontent.com/vmudigal/test/main/dummy.json")
        .whenComplete(() {
      NetworkCallsCounter.count++;
    });

    var json = convert.jsonDecode(response.body);
    //print("jsonResponse ======" + jsonRespnse['data'].toString());
    List<Data> dataList = new List<Data>();
    // if (json['data'] != null) {
    json['data'].forEach((v) {
      dataList.add(new Data.fromJson(v));
    });
    return dataList;
    // } else {
    //   print("Json data empty");
    // }
  }
}

class Data {
  String imageUrl;
  String title;
  String type;

  Data({this.imageUrl, this.title, this.type});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        imageUrl: json['image_url'], title: json['title'], type: json['type']);
    // imageUrl = json['image_url'];
    // title = json['title'];
    // type = json['type'];
  }
}
