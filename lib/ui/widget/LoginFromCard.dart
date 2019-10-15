import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(600),
//      decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.circular(5.0),
//          boxShadow: [
//            BoxShadow(
//                color: Colors.black12,
//                offset: Offset(0.0, 15.0),
//                blurRadius: 15.0),
//            BoxShadow(
//                color: Colors.black12,
//                offset: Offset(0.0, -5.0),
//                blurRadius: 5.0),
//          ]),
      child: Padding(
        padding:
        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil.getInstance().setSp(45),
                  fontFamily: "Montserrat",
                  letterSpacing: 6),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Text(
              "Username",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: ScreenUtil.getInstance().setSp(26)),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: 12)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text(
              "Password",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: ScreenUtil.getInstance().setSp(26)),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: 12)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password ?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize:
                      ScreenUtil.getInstance().setSp(28),
                      fontFamily: "Montserrat",
                      letterSpacing: 2),
                )
              ],
            ),


            Align(
              alignment: Alignment(0.8, -2.5),
              heightFactor: 0.5,
              child: FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.arrow_forward),
              ),
            )
          ],
        ),
      ),
    );
  }


}