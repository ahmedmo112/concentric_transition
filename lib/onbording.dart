import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

class ScreensData{
   // final String? title;
    final String image;
    final Color bgC;

  ScreensData({required this.image,  required this.bgC});
  }

class OnBording extends StatelessWidget {
  OnBording({ Key? key }) : super(key: key);


  final List<ScreensData> pages = [
    ScreensData(
      image: "images/hacker.png",
      bgC: Colors.pinkAccent
    ),
    ScreensData(
     image: "images/hologram.png",
      bgC: Colors.yellow
    ),
    ScreensData(
      image: "images/database.png",
      bgC: Colors.indigo
      
    ),
    ScreensData(
      image: "images/camera.png",
      bgC: Colors.yellow
      
    ),
  ];

  List<Color> get colors => pages.map((p) => p.bgC).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConcentricPageView(
          colors: colors,
          opacityFactor: 0.5,
         scaleFactor: 1,
          radius: 30,
          curve: Curves.ease,
          duration: Duration(seconds: 2),
//!         verticalPosition: 0.7,
//?         direction: Axis.vertical,
//?          itemCount: pages.length,
// !         physics: NeverScrollableScrollPhysics(),
          itemBuilder: (index, value) {
            ScreensData page = pages[index % pages.length];
            return Container(
                child: PageCard(page: page),
              
            );
          }
        )
            
            );
  }

}
  class PageCard extends StatelessWidget {
  final ScreensData page;

  const PageCard({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: _buildPicture(context),
    );
  }
  Widget _buildPicture(
    BuildContext context, {
    double size = 190,
    double iconSize = 170,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
       
        image: DecorationImage(image: AssetImage(page.image,),fit: BoxFit.contain)
      ) 
    );
  }
  }
