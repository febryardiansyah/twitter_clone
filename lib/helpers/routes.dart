import 'package:flutter/material.dart';
import 'package:twitter_clone/index.dart';
import 'package:twitter_clone/screens/home_screen/home_screen.dart';
import 'package:twitter_clone/screens/login_screen/login_screen.dart';
import 'package:twitter_clone/screens/post_tweet_screen/post_tweet_screen.dart';
import 'package:twitter_clone/screens/register_screen/register_screen.dart';
import 'package:twitter_clone/screens/splash_screen.dart';
import 'package:twitter_clone/screens/welcome_screen/welcome_screen.dart';

MaterialPageRoute _pageRoute ({Widget child,RouteSettings settings,bool isFullScreen = false})=>MaterialPageRoute(
  builder: (_)=>child,
  settings: settings,
  fullscreenDialog: isFullScreen
);

Route generateRoute(RouteSettings settings){
  final args = settings.arguments;
  switch(settings.name){
    case rWelcomeScreen:
      return _pageRoute(child: WelcomeScreen(),settings: settings);
      break;
    case rLoginScreen:
      return _pageRoute(child: LoginScreen(),settings: settings);
      break;
    case rRegisterScreen:
      return _pageRoute(child: RegisterScreen(),settings: settings);
      break;
    case rHomeScreen:
      return _pageRoute(child: HomeScreen(),settings: settings);
      break;
     case rIndex:
       return _pageRoute(child: Index(),settings: settings);
       break;
    case rSplashScreen:
      return _pageRoute(child: SplashScreen(),settings: settings);
      break;
    case rTweetScreen:
      return _pageRoute(child: PostTweetScreen(),settings: settings);
      break;
  }
}

const String rSplashScreen = '/splash';
const String rWelcomeScreen = '/welcome';
const String rLoginScreen = '/login';
const String rRegisterScreen = '/register';
const String rHomeScreen = '/home';
const String rIndex = '/';
const String rTweetScreen = '/tweet';