

import 'dart:developer';

//import 'package:news_app/model/article_model.dart';
import 'dart:convert' ;

import 'package:http/http.dart' as http;
import 'package:news_app/model/show_category.dart';
import 'package:news_app/model/source_model.dart';


class ShowCategoryNews{
  List<ShowCategoryModel> categories=[];

  Future<void> getCategories(String category) async{
     //String endurl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=837a7f68799644bcbb1d5700fdf6a227";
     //var client=http.Client();
     
     try{
      var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=837a7f68799644bcbb1d5700fdf6a227"));
    print(response.statusCode);
    print(category);
    print("oject");
     
     var json = jsonDecode(response.body);
     print(json);

     if(json['status'] == 'ok'){
      json["articles"].forEach((element){
        if(element["urlToImage"] !=null && element["description"] !=null){
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            auther: element["author"], 
            title: element ["title"], 
            description:element ["description"], 
            url:element ["url"], 
            urltoimage:element ["urlToImage"], 
            content:element ["content"], 
            publishedAt:element ["publishedAt"]);
            categories.add(showCategoryModel);
            print(categories);
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