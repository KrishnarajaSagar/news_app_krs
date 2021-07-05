import 'package:flutter/material.dart';
import 'package:news_api_app/helper/news.dart';
import 'package:news_api_app/models/article_model.dart';
import 'package:news_api_app/models/category_model.dart';
import 'package:news_api_app/helper/data.dart';
import 'package:news_api_app/widgets/category_tile.dart';
import 'package:news_api_app/widgets/blog_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
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
        title: const Text(
          "News",
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFbf616a),
              ),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: device.height / 10,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryTile(
                      categoryName: categories[index].categoryName,
                      imgUrl: categories[index].imgUrl,
                    ),
                  ),
                ),
                Expanded(
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
              ],
            ),
    );
  }
}
