class SliderModel{
  //Source source;
  String? auther;
  String? title;
  String? description;
  String? url;
  String? urltoimage;
  String? publishedAt;
  String? content;

  SliderModel({
     this.auther,
    //required this.source,
     this.title,
     this.description, this.url, this.urltoimage,
     this.content, this.publishedAt
    });
}
  // Source({required this.categoryName,required this.image});

  // factory Source.fromJson(Map<String,dynamic> json){
  //   return Source(categoryName: json['id'],image: json['name']);
  // }

