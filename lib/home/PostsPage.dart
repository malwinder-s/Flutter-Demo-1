import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatefulWidget {
  PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("--------Row--------\n${widgets[i]}\n\n"),
    );
  }

  Future<void> loadData() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');

      setState(() {
        widgets = [jsonResponse.values];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
