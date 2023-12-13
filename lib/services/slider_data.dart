import 'package:news_app/model/source_model.dart';

List<SliderModel> getSliders(){
  List<SliderModel> slider=[];
  SliderModel sliderModel=new SliderModel();

  sliderModel.name="Bussines";
  sliderModel.image="assets/images/bird.jpeg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.name="Bussines";
  sliderModel.image="assets/images/bird.jpeg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.name="Bussines";
  sliderModel.image="assets/images/bird.jpeg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.name="Bussines";
  sliderModel.image="assets/images/bird.jpeg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();
  return slider;
}