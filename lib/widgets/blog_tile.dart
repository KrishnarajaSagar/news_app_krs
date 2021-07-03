import 'package:flutter/material.dart';
import 'package:news_api_app/views/article_screen.dart';

import '../constants.dart';

class BlogTile extends StatelessWidget {
  final String title, imgUrl, description, url;
  BlogTile(
      {required this.title,
      required this.imgUrl,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ArticleScreen(
              articleUrl: url,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ),
                ),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF434c5e),
          borderRadius: BorderRadius.circular(10),
        ),
        height: (device.height / 5) + 15,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                      height: device.height / 12,
                      width: device.height / 12,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: kHeaderTextStyle,
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Text(
                description,
                style: kContentTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
