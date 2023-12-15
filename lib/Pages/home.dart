import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:news_app/Pages/article_view.dart';
import 'package:news_app/Pages/category_news.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/source_model.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:news_app/services/news.dart';
import 'dart:convert' ;

import 'package:http/http.dart' as http;



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //ApiService client = ApiService();
  List<CategoryModel> categories=[]; 
  List<SliderModel> Sliders=[]; 
  List<Article> articles=[];
  // bool _loading=true;

  @override
  void initState() {
    categories = getCategories();
    getSliders();
    getNews();
    super.initState();
  }

  getNews()async{
    News newsclass = News();
    await newsclass.getNews();
    articles=newsclass.news;
    //print(articles);
    // setState(() {
    //   _loading=false;
    // });
  }
  getSliders()async{
    slider newsclass = slider();
    await newsclass.getSliders();
    Sliders=newsclass.sliders;
    //print(articles);
    // setState(() {
    //   _loading=false;
    // });
  }
//  Future<void> getNews() async{
//      String endurl = "https://newsapi.org/v2/everything?q=tesla&from=2023-11-12&sortBy=publishedAt&apiKey=837a7f68799644bcbb1d5700fdf6a227";
//      var client=http.Client();
//      try{
//      var response = await client.get(Uri.parse(endurl));
//    //  print(response.code);
     
//      //var json = jsonDecode(response.body);
//      //print(response.body);}
//      catch(e){
//       log(e.toString() );
//      }}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
       appBar: AppBar(
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter",style: TextStyle(color: Colors.black),),
            Text("News",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
          ],
          ),
          //centerTitle: true,
          backgroundColor: Colors.white,
        elevation: 0.0,
       ),
      //  body: FutureBuilder(
      //   future: client.getArticle(),
      //   builder: (BuildContext context,AsyncS),
      //   builder: (BuildContext context,AsyncSnapshot<List<Article>> snapshot) {
      //     if(snapshot.hasData){
      //       return Center(child: Text("success"),);
      //     }
      //     return
      //       Center(
      //         child: Text("fail"),
      //       );
          
      //   },
      //  ),
        body:SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Container(
                margin: EdgeInsets.only(left:10.0),
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder:(context, index) {
                    return CategoryTile(
                        image: categories[index].image,
                        categoryName: categories[index].categoryName,
                    );
                  },
                  ),
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                [
                  Text("Breaking News",style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
                  Text("View All",style: TextStyle(color: Colors.blue,fontSize: 16.0,fontWeight: FontWeight.w500),)
                ])
              ),
              SizedBox(height: 20.0,),
               Container(
                height: 200,
          child: CarouselSlider.builder(
            slideBuilder: (index) {
              String? slide = Sliders[index].urltoimage;
              String? slide1 = Sliders[index].title;
              return buildImage(slide!, index, slide1!);
            },
            itemCount: Sliders.length,
            viewportFraction: 1,
            unlimitedMode: true,
            //enableAutoSlider: true,
            //slideTransform: CubeTransform(),
            slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 12),
            ),
          ),
        ),
        SizedBox(height: 30.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                [
                  Text("Trending News",style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
                  Text("View All",style: TextStyle(color: Colors.blue,fontSize: 16.0,fontWeight: FontWeight.w500),)
                ])
              ),
              SizedBox(height: 10.0,),
              
              Container(
                child: ListView.builder(shrinkWrap: true,physics: ClampingScrollPhysics(),itemCount: articles.length,itemBuilder: (context,index){
                  return BlogTile(imageUrl: articles[index].urltoimage!, title: articles[index].title!,
                   desc:articles[index].description!,url: articles[index].url!,
                   );
                }),
              )
              // GestureDetector(
              //   onTap: () {
                  
              //   },
              
              // child:Padding(
              //   padding: const EdgeInsets.symmetric(horizontal:10.0),
              //   child: Material(
              //     elevation: 3.0,
              //     borderRadius: BorderRadius.circular(10.0),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 4.0),
              //       child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
                            
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(10),
              //                 child: Image.asset("assets/images/bird.jpeg",height: 150,width: 150,fit: BoxFit.cover,)),
              //             ),
              //             SizedBox(width: 7.0,),
              //             Column(
              //               children: [Container(
              //                 width: MediaQuery.of(context).size.width/1.9,
              //                 child: Text("Gauthier and de Queiroz[12] identified four different ",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),)
              //               ),
              //               SizedBox(height: 5.0,),
              //               Container(
              //               width: MediaQuery.of(context).size.width/1.9,
              //               child: Text("Under the fourth definition Archaeopteryx, traditionally ",style: TextStyle(color: Colors.black38,fontSize: 15.0,fontWeight: FontWeight.w500),)
              //             ),]
              //             ),
                          
              //           ],
              //         ),
              //     ),
                  
              //   ),
              // ),
              // ),
              ],
              
            ),
          ),
        ),
    );
  }
  Widget buildImage(String image,int index,String name)=>Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0,),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: 
            Image.network(image,height: 250,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,)
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: 250,
          margin: EdgeInsets.only(top: 130.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),color: Colors.black26),
              child: 
              Text(name,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
            ),
        
      ]
    ),
  );
} 

class CategoryTile extends StatelessWidget {
  //const CategoryTile({super.key});
  final image,categoryName;
  CategoryTile({this.categoryName,this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(name: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(image,width: 120,height: 70,fit: BoxFit.cover,)
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26
              ),
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
class BlogTile extends StatelessWidget {
  String imageUrl,title,
  desc,url
  ;
  BlogTile({required this.imageUrl,required this.title,
  required this.desc,required this.url
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));
                },
               
              child:Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 6.0),
                  child: Material(
                    
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 4.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(imageUrl,height: 150,width: 150,fit: BoxFit.cover,)),
                            ),
                            SizedBox(width: 7.0,),
                            Column(
                              children: [Container(
                                width: MediaQuery.of(context).size.width/1.9,
                                child: Text(title,maxLines: 2,style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),)
                              ),
                              SizedBox(height: 5.0,),
                              Container(
                              width: MediaQuery.of(context).size.width/1.9,
                              child: Text(desc,maxLines: 3,style: TextStyle(color: Colors.black54,fontSize: 15.0,fontWeight: FontWeight.w500),)
                            ),]
                            ),
                            
                          ],
                        ),
                    ),
                    
                  ),
                ),
              ),
              );
  }
}