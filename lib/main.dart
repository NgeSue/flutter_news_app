import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roman_ui_app/technology_news.dart';
import 'detail_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  String baseUrl =
      'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.voanews.com%2Fapi%2Fzyritequir';
  Future<List<Items>?> getNews() async {
    return await http.get(Uri.parse(baseUrl)).then((value) {
      Technology tn = Technology.fromJson(json.decode(value.body.toString()));
      return tn.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
          backgroundColor: Colors.indigo[100],
          appBar: AppBar(
            leading: const Icon(Icons.article_outlined),
            title: Row(
              children: [
                const Text('Tech သတင်း'),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  dateToday.toString(),
                  style: const TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
          body: FutureBuilder(
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                List<Items>? items = snapshot.data;

                return ListView(
                    children: items!.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => DetailPage(e))));
                    },
                    child: SizedBox(
                      height: 90,
                      child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: Row(children: [
                            Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Hero(
                                    tag: e.enclosure!.link.toString(),
                                    child: Image.network(
                                      e.enclosure!.link.toString(),
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  e.title.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 2, 7, 36)),
                                ))
                          ])),
                    ),
                  );
                }).toList());
              }
            },
            future: getNews(),
          )),
    );
  }
}
