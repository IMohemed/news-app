import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/Pages/home.dart';
import 'package:news_app/Pages/landing_page.dart';
import 'package:news_app/services/news.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      MyHomePage( title: 'flutter',),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

  
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //ApiService client = ApiService();

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//        appBar: AppBar(
//         title: Text("myapp",style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//        ),
//        body: FutureBuilder(
//         //future: client.getArticle(),
//         //builder: (BuildContext context,AsyncS),
//         builder: (BuildContext context,AsyncSnapshot<List<Article>> snapshot) {
//           if(snapshot.hasData){
//             return Center(child: Text("success"),);
//           }
//           return
//             Center(
//               child: Text("fail"),
//             );
          
//         },
//        ),
//     );
//   }
// }
