import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampleapp/ui/widget/LoginFromCard.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
//If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/logo.png",
                      width: ScreenUtil.getInstance().setWidth(650),
                      height: ScreenUtil.getInstance().setHeight(300),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  //  Image.asset("assets/plate2.png" ,height: 500.0,width: 500.0,)
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                    child: Column(
                      children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Text(
//                            "Login",
//                            style: TextStyle(
//                                fontStyle: FontStyle.normal,
//                                fontFamily: "Montserrat",
//                                fontSize: 25,
//                                fontWeight: FontWeight.bold),
//                          )
//                        ],
//                      )
//                    ],
//                  ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(300),
                        ),

                        LoginCard(),

                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(200),
                        ),
                        Text(
                          "Registration",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize:
                              ScreenUtil.getInstance().setSp(28),
                              fontFamily: "Montserrat",
                              letterSpacing: 2),
                        )

                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
