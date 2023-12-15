import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/show_category.dart';
import 'package:news_app/services/show_category.dart';

class CategoryNews extends StatefulWidget {
  //const CategoryNews({super.key});
  String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories=[];

   @override
  void initState() {
    
    
    super.initState();
    getNews();
  }

  getNews()async{
    ShowCategoryNews newsclass = ShowCategoryNews();
    await newsclass.getCategories(widget.name.toLowerCase());
    categories=newsclass.categories;
    //print(articles);
    // setState(() {
    //   _loading=false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: 
            
            Text(widget.name,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
          
          
          //centerTitle: true,
          backgroundColor: Colors.blueGrey,
        elevation: 0.0,
       ),
       body:  Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(shrinkWrap: true,physics: ClampingScrollPhysics(),itemCount: categories.length,itemBuilder: (context,index){
                  return ShowCategory(imageUrl: categories[index].urltoimage!, title: categories[index].title!,
                   desc:categories[index].description!
                   );
                }),
              )
    );
  }
}

class ShowCategory extends StatelessWidget {
  //const ShowCategory({super.key});
  String imageUrl,title,
  desc
  ;
  ShowCategory({required this.imageUrl,required this.title,
  required this.desc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        
        children: [
          SizedBox(height: 15.0,),
           ClipRRect(
            
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(imageUrl,height: 200,width:MediaQuery.of(context).size.width,fit: BoxFit.cover,)),
            SizedBox(height: 5.0,),
           Text(title,style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold)),
           SizedBox(height: 2.0,),
           Text(desc)
        ],
      ),
    );
  }
}