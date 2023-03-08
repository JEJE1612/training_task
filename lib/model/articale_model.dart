import 'screen_model.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String urltoimage;
  String? publishedat;
  String? content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      required this.urltoimage,
      this.publishedat,
      this.content});
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromjson(json['source']),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description']as String?,
      url: json['url'] as String?,
      publishedat: json['publishedat'] as String?,
      urltoimage: json['urlToImage'] as String,

      content: json['contect'] as String?,
      
    );
    
  }
}
