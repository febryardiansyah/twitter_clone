import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/bloc/auth_bloc/auth_bloc.dart';
import 'package:twitter_clone/helpers/routes.dart';
import 'package:twitter_clone/utils/base_color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){},
          child: Padding(
            padding: EdgeInsets.all(12),
            child: CircleAvatar(
              backgroundColor: BaseColor.white,
              maxRadius: 30,
            ),
          )
        ),
        title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.pencilAlt),
        onPressed: ()=>Navigator.pushNamed(context, rTweetScreen),
      ),
      body: Center(
        child: FlatButton(
          child: Text('logout',),
          color: BaseColor.white,
          onPressed: ()=>BlocProvider.of<AuthBloc>(context).add(LoggedOut()),
        ),
      ),
    );
  }
}