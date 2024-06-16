import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_v2/model/models_disaster_article.dart';

class DisasterArticleViewmodel with ChangeNotifier {
  bool _isLoading = false;
  List<News> _disasterArticleList = [];

  bool get isLoading => _isLoading;
  List<News> get disasterArticleList => _disasterArticleList;

  Future<void> getDisasterArticle() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse("https://api.worldnewsapi.com/search-news?api-key=API_KEY&text=disasters"));

      if (response.statusCode == 200) {
        _disasterArticleList = disasterArticleFromJson(response.body).news;
      } else {
        throw Exception("Failed to load articles");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
