// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String author;
  final String date;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.author,
    required this.date,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] as String? ??
          'fa', // Provide a default value if 'title' is null
      description: json['description'] as String? ??
          'da', // Provide a default value if 'description' is null
      url: json['url'] as String? ??
          'dA', // Provide a default value if 'url' is null
      urlToImage: json['urlToImage'] as String? ??
          'https://us.123rf.com/450wm/urfandadashov/urfandadashov1806/urfandadashov180601827/150417827-photo-not-available-vector-icon-isolated-on-transparent-background-photo-not-available-logo-concept.jpg', // Provide a default value if 'urlToImage' is null
      author: json['author'] as String? ??
          'DA', // Provide a default value if 'author' is null
      date: json['publishedAt'] as String? ?? 'DA'
    );
  }

  static Future<List<NewsArticle>> getTopHeadlines(
      String country, String apiKey) async {
    try {
      final Uri uri = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=${country}&apiKey=${apiKey}');

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data['status'] == 'ok' && data['articles'] is List) {
          List<dynamic> articles = data['articles'];

          // You may need to adjust the following line to extract and create NewsArticle objects correctly.
          List<NewsArticle> newsArticles = articles.map((item) {
            return NewsArticle.fromJson(item);
          }).toList();

          return newsArticles;
        } else {
          throw Exception('Failed to load news data: ${data['message']}');
        }
      } else {
        throw Exception('Failed to load news data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('An error occurred while fetching news data');
    }
  }
}
