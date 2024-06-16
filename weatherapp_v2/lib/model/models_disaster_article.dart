// To parse this JSON data, do
//
//     final disasterArticle = disasterArticleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DisasterArticle disasterArticleFromJson(String str) =>
    DisasterArticle.fromJson(json.decode(str));

String disasterArticleToJson(DisasterArticle data) =>
    json.encode(data.toJson());

class DisasterArticle {
  final List<News> news;

  DisasterArticle({
    required this.news,
  });

  factory DisasterArticle.fromJson(Map<String, dynamic> json) =>
      DisasterArticle(
        news: json["news"] != null
            ? List<News>.from(json["news"].map((x) => News.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
      };
}

class News {
  final int id;
  final String title;
  final String text;
  final String summary;
  final String url;
  final String image;
  final DateTime publishDate;
  final String author;
  final List<String> authors;
  final String sourceCountry;
  final double sentiment;

  News({
    required this.id,
    required this.title,
    required this.text,
    required this.summary,
    required this.url,
    required this.image,
    required this.publishDate,
    required this.author,
    required this.authors,
    required this.sourceCountry,
    required this.sentiment,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        summary: json["summary"],
        url: json["url"],
        image: json["image"],
        publishDate: DateTime.parse(json["publish_date"]),
        author: json["author"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        sourceCountry: json["source_country"],
        sentiment: json["sentiment"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "text": text,
        "summary": summary,
        "url": url,
        "image": image,
        "publish_date": publishDate.toIso8601String(),
        "author": author,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "source_country": sourceCountry,
        "sentiment": sentiment,
      };
}

enum Language { EN }

final languageValues = EnumValues({"en": Language.EN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
