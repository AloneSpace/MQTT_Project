import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mqtt_project/screens/home.dart';
import 'package:mqtt_project/services/fb_auth.dart';
import 'package:mqtt_project/widgets/CustonIcons.dart';
import 'package:mqtt_project/widgets/SocialIcons.dart';

class Login extends StatelessWidget {
  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(105),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  Future navigateToSubPage(context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/images/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/images/image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(400),
                  ),
                  Container(
                    width: double.infinity,
                    height: ScreenUtil.getInstance().setHeight(500),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                horizontalLine(),
                                Text("เข้าสู่ระบบ",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: "KoHo-Medium")),
                                horizontalLine()
                              ]),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SocialIcon(
                                colors: [
                                  Color(0xFF102397),
                                  Color(0xFF187adf),
                                  Color(0xFF00eaf8),
                                ],
                                iconData: CustomIcons.facebook,
                                onPressed: () =>
                                    FacebookAuth().loginWithFacebook(context),
                              ),
                              SocialIcon(
                                colors: [
                                  Color(0xFFff4f38),
                                  Color(0xFFff355d),
                                ],
                                iconData: CustomIcons.googlePlus,
                                onPressed: () {
                                  navigateToSubPage(context);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ])),
          )
        ]));
  }
}
