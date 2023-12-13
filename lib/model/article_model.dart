import 'package:news_app/model/source_model.dart';

class Article{
  //Source source;
  String? auther;
  String? title;
  String? description;
  String? url;
  String? urltoimage;
  String? publishedAt;
  String? content;

  Article({
     this.auther,
    //required this.source,
     this.title,
     this.description, this.url, this.urltoimage,
     this.content, this.publishedAt
    });
}
//   factory Article.fromJson(Map<String,dynamic> json){
//     return Article(
//       //source: Source.fromJson(json['source']),
//       auther: json['author'] as String,
//       title: json['title'] as String,
//       description: json['description'] as String,
//       url: json['url'] as String,
//       urltoimage: json['urlToImage'] as String,
//       publishedAt: json['publishedAt'] as String,
//       content: json['content'] as String,
//     );
//   }
  
// }

