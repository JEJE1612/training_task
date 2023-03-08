import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:training_task/model/articale_model.dart';

class ApiService {
  final endpoint = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryparameters = {
      'domains': 'wsj.com',
      'apiKey': 'f629dbd6d2b24bcc9010d2747921ee7b'
    };
    // ignore: unused_local_variable
    final uri = Uri.https(endpoint, '/v2/everything', queryparameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;
  }
}
