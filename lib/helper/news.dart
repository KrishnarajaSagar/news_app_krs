import 'dart:convert';
import 'package:news_api_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String apiUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=26bc54f37fb14b758d73708b37a0c8d3";
    var response = await http.get(Uri.parse(apiUrl));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            url: element['url'],
            description: element['description'],
            urlToImg: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String apiUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=26bc54f37fb14b758d73708b37a0c8d3";
    var response = await http.get(Uri.parse(apiUrl));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            url: element['url'],
            description: element['description'],
            urlToImg: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
