import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sampleapp/animation/FadeAnimation.dart';
import 'package:sampleapp/ui/home/HomeScreen.dart';
import 'package:sampleapp/ui/values/Styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  bool _textVisble = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);

    super.initState();
  }

  void _inTap() {
    setState(() {
      _textVisble = false;
    });

    _animationController.forward().then((f) => Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: HomeScreen())));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/ic_firstimg.jpg"),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.2),
          ])),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                    .5,
                    Text(
                      "Taking Order For delivery.",
                      style: splashheadingStyle,
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1,
                    Text(
                      "See Reaturant near by \nadding Location.",
                      style: splashproductSubTitleStyle,
                    )),
                SizedBox(
                  height: 50,
                ),
                FadeAnimation(
                    1.2,
                    ScaleTransition(
                      scale: _animation,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  colors: [
                                    Colors.yellow,
                                    Colors.orange,
                                  ])),
                          child: AnimatedOpacity(
                            opacity: _textVisble ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 50),
                            child: MaterialButton(
                              onPressed: () => _inTap(),
                              minWidth: double.infinity,
                              child: Text(
                                "Start",
                                style: splashproductSubTitleStyle,
                              ),
                            ),
                          )),
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.4,
                    Align(
                      child: AnimatedOpacity(
                          opacity: _textVisble ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 50),
                          child: Text("Now Deliver to your Door 24/7",
                              style: splashspeackerdesStyle)),
                    )),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
