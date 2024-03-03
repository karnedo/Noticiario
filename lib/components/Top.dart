import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/News.dart';
import 'SmallNews.dart';

class Top extends StatelessWidget{
  News topNew;
  List<News> list_news;

  Top(this.topNew, this.list_news);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      header(),
      SizedBox(height: 8.0),
      starredNews(),
      ratedNews(),
    ]);
  }

  Widget header() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 60.0, // Aumenta la altura para dar espacio al padding superior
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.blue,
                Colors.transparent
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: Text(
            'Actualidad',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget starredNews() {
    return Stack(
      children: [
        FractionallySizedBox(
          widthFactor: 1.0,
          child: Image.network(
            topNew.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            color: Colors.black.withOpacity(0.25),
            padding: EdgeInsets.all(8.0),
            child: Text(
              topNew.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget ratedNews() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          height: 110.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list_news.length,
            itemBuilder: (context, index) {
              return SmallNews(list_news[index]);
            },
          )),
    );
  }



}