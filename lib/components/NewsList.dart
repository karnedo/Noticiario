import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/News.dart';
import 'SmallNews.dart';

class NewsList extends StatelessWidget {
  List<News> newsList;

  NewsList(this.newsList);

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: newsList.map((news) {
            return Card(
              child: Column(
                children: [
                Image.network(news.image),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(news.title, style: TextStyle(fontSize: 16)),
                ),
                ],
              ),
            );
            }).toList(),
        ),
      );
  }

}
