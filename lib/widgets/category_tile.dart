import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api_app/views/category_view.dart';

import '../constants.dart';

class CategoryTile extends StatelessWidget {
  String categoryName;
  String imgUrl;

  CategoryTile({required this.categoryName, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                CategoryView(
              category: categoryName,
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
        child: Stack(children: [
          ClipRRect(
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              height: 60,
              width: 120,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Container(
            child: Center(
              child: Text(
                categoryName,
                style: kContentTextStyle.copyWith(color: Colors.white),
              ),
            ),
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ]),
        padding: const EdgeInsets.only(left: 10),
      ),
    );
  }
}
