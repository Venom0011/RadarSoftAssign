import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String url = "http://organizergathrr.radarsofttech.in/api/getallevent";
  List data;

  @override
  void initState() {
    super.initState();

    getJsonData();
  }

  Future<String> getJsonData() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = Uri.parse('http://organizergathrr.radarsofttech.in/api/getallevent');

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
    return "Succes";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retrieve"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Column(
              children: [
                Card(child: Container(child: Text(data[index]["event_banner_img1"]), padding: const EdgeInsets.all(20)))
              ],
            ),
          );
        },
      ),
    );
  }
}
