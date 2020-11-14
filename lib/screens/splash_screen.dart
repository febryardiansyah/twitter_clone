import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/helpers/routes.dart';
import 'package:twitter_clone/utils/base_color.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),()=>Navigator.pushReplacementNamed(context, rIndex));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.blue3,
      body: Center(
        child: Icon(FontAwesomeIcons.twitter,color: BaseColor.blue1,size: 40,),
      ),
    );
  }
}