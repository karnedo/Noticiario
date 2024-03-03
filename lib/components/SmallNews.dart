import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/News.dart';

class SmallNews extends StatelessWidget {
  News news;

  SmallNews(this.news);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10.0,
            ),
            Container(
              height: 110.0,
              width: 230.0,
              child: Stack(
                children: [
                  Image.network(
                    news.image,
                    fit: BoxFit.fill,
                    height: 110.0,
                    width: 230.0,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        news.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}