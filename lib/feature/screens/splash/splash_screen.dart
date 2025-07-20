import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/style/text_style.dart';
import 'package:news/feature/screens/home_screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController text1Controller;
  late AnimationController text2Controller;
  late AnimationController imageController;
  late Animation<Offset> animateText1;
  late Animation<Offset> animateText2;
  late Animation<Offset> animateimage;

  @override
  void initState() {
    text1Controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    text2Controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    imageController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animateText1 = Tween<Offset>(begin: const Offset(-5, 0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: text1Controller, curve: Curves.linear));
    animateText2 = Tween<Offset>(begin: const Offset(5, 0), end: Offset.zero)
        .animate(
        CurvedAnimation(parent: text2Controller, curve: Curves.linear));
    animateimage = Tween<Offset>(begin: const Offset(0, -7), end: Offset.zero)
        .animate(
        CurvedAnimation(parent: text2Controller, curve: Curves.linear));
    text1Controller.forward();
    text2Controller.forward();
    imageController.forward();

    Future.delayed(
      Duration(seconds: 8),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      },
    );




    super.initState();
  }

  @override
  void dispose() {
    text1Controller.dispose();
    text2Controller.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFE3F2FD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: animateimage,
            child: Image(
                image: AssetImage("assets/images/splashimage.gif")
            ),
          ),
          SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SlideTransition(
                  position: animateText1,
                  child: Text(
                    "Read ",
                    style: TextStyleApp.black25semibold.copyWith(color: Color(0xFF1A237E),fontSize: 35),
                  )),
              SlideTransition(
                position: animateText2,
                child: Text(
                  "News",
                  style: TextStyleApp.black25semibold.copyWith(color: Color(0xFFD32F2F),fontSize: 35),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
