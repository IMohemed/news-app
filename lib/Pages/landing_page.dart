import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset("assets/images/bird.jpeg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.7,
              fit: BoxFit.cover,),
            ),
            SizedBox(height: 20.0,),
            
            Text(" identified four different  same\n              definitions for the",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
             SizedBox(height: 18.0,),
            Text("identified four different  definitions for the\n                         same biological",style: TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 40.0,),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 5.0,
                child: Container(
                  
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(30.0)),
                  child: Center(
                    child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}