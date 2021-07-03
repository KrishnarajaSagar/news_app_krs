import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_api_app/constants.dart';
import 'package:news_api_app/helper/data.dart';
import 'package:news_api_app/helper/news.dart';
import 'package:news_api_app/models/article_model.dart';
import 'package:news_api_app/widgets/blog_tile.dart';

class CategoryView extends StatefulWidget {
  final String category;
  CategoryView({required this.category});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: kHeaderTextStyle,
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFbf616a),
              ),
            )
          : Container(
              height: device.height,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => BlogTile(
                      title: articles[index].title,
                      imgUrl: articles[index].urlToImg,
                      description: articles[index].description,
                      url: articles[index].url,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
