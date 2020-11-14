import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/bloc/auth_bloc/auth_bloc.dart';
import 'package:twitter_clone/screens/home_screen/home_screen.dart';
import 'package:twitter_clone/screens/my_bottom_navbar.dart';
import 'package:twitter_clone/screens/welcome_screen/welcome_screen.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc,AuthState>(
        builder: (context,state){
          print(state);
          if(state is AuthLoading || state is AuthInitial){
            return Container(
              child: Center(child: Text('this is SplashScreen'),),
            );
          }
          if(state is AuthAuthenticated){
            return MyBottomNavBar();
          }
          if(state is AuthUnAuthenticated){
            return WelcomeScreen();
          }
          return Container();
        },
      ),
    );
  }
}
