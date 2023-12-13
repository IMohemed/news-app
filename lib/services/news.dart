

import 'dart:developer';

import 'package:news_app/model/article_model.dart';
import 'dart:convert' ;

import 'package:http/http.dart' as http;


class News{
  List<Article> news=[];

  Future<void> getNews() async{
     //String endurl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=837a7f68799644bcbb1d5700fdf6a227";
     //var client=http.Client();
     
     try{
      var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=837a7f68799644bcbb1d5700fdf6a227"));
    print(response.statusCode);
    print("object");
     
     var json = jsonDecode(response.body);
     print(json);

     if(json['status'] == 'ok'){
      json["articles"].forEach((element){
        if(element["urlToImage"] !=null && element["description"] !=null){
          Article article = Article(
            auther: element["author"], 
            title: element ["title"], 
            description:element ["description"], 
            url:element ["url"], 
            urltoimage:element ["urlToImage"], 
            content:element ["content"], 
            publishedAt:element ["publishedAt"]);
            news.add(article);
            print(news);
        }
        else {
       print('A network error occurred');
    }
      });
     }
     }
     catch(e){
      log(e.toString());
     }
  }
}