import 'package:flutter/material.dart';
import 'technology_news.dart';

class DetailPage extends StatelessWidget {
  final Items items;
  const DetailPage(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(items.title.toString())),
      body: ListView(
        children: [
          Hero(
            tag: items.enclosure!.link.toString(),
            child: Image.network(
              items.enclosure!.link.toString(),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Text(
                  items.title.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  items.pubDate.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  items.description.toString(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
