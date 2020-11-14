import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/helpers/routes.dart';
import 'package:twitter_clone/utils/base_color.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.blue3,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Icon(
          FontAwesomeIcons.twitter,
          color: BaseColor.blue2,
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 30),
        height: 30,
        child: GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, rLoginScreen),
          child: RichText(
            text: TextSpan(
              text: 'Have an account already ? ',
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: 'Log in',
                  style: TextStyle(color: BaseColor.blue2)
                )
              ]
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("See what's\nhappening in the\nworld right now.",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, rRegisterScreen),
                  child: Container(
                    color: BaseColor.blue1,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: Text('Create account',style: TextStyle(color: Colors.white),),),
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
