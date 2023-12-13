import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' ;
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';

// class ApiService{
//   final endurl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=837a7f68799644bcbb1d5700fdf6a227";
//   //var client= http.Client();

//   Future<List<Article>> getArticle() async{
//     Response res = await get(Uri.parse(endurl));

//     if(res.statusCode == 200){
//       Map<String,dynamic> json = jsonDecode(res.body);
//       List<dynamic> body = json['articles'];
//       List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
//       return articles;
//     }
//     else{
//       throw("can't get the articles");
//     }
//    }

// }
List<CategoryModel> getCategories(){
  List<CategoryModel> category=[];
  CategoryModel categoryModel=new CategoryModel();

  categoryModel.categoryName="Bussines";
  categoryModel.image="assets/images/bird.jpeg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName="entertaintment";
  categoryModel.image="assets/images/bird.jpeg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName="health";
  categoryModel.image="assets/images/bird.jpeg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName="londery";
  categoryModel.image="assets/images/bird.jpeg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  return category;
}
