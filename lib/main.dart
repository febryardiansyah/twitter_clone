import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/bloc/auth_bloc/auth_bloc.dart';
import 'package:twitter_clone/bloc/login_bloc/login_bloc.dart';
import 'package:twitter_clone/bloc/post_tweet_bloc/post_tweet_bloc.dart';
import 'package:twitter_clone/bloc/register_bloc/register_bloc.dart';
import 'package:twitter_clone/helpers/routes.dart';
import 'package:twitter_clone/locator.dart' as di;
import 'package:twitter_clone/utils/base_color.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await di.init();
  runApp(BlocProvider<AuthBloc>(
    create: (context) => AuthBloc()..add(AppStarted()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(AppStarted()),
        ),
        BlocProvider<PostTweetBloc>(
          create: (context) => PostTweetBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: BaseColor.white,
          accentColor: BaseColor.white,
          scaffoldBackgroundColor: BaseColor.blue3,
          appBarTheme: AppBarTheme(color: BaseColor.blue3,textTheme: TextTheme(headline6: TextStyle(color: BaseColor.white,fontWeight: FontWeight.bold,fontSize: 20)),iconTheme: IconThemeData(
            color: BaseColor.white
          )),
          textTheme: TextTheme(
            caption: TextStyle(color: BaseColor.blue2),
            button: TextStyle(color: BaseColor.blue1),
          ),
          hintColor: BaseColor.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: rSplashScreen,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
