import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/bloc/login_bloc/login_bloc.dart';
import 'package:twitter_clone/helpers/routes.dart';
import 'package:twitter_clone/locator.dart';
import 'package:twitter_clone/utils/base_color.dart';
import 'package:twitter_clone/widgets/build_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  void initState() {
    super.initState();
    BlocProvider.of<LoginBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.blue3,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('Forgot Password',style: TextStyle(color: BaseColor.blue1),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                  color: BaseColor.blue1,
                  child: Text('Login',style: TextStyle(color: BaseColor.white),),
                  onPressed: (){
                    context.bloc<LoginBloc>().add(DoLogin(
                      email: _email.text,password: _password.text
                    ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        backgroundColor: BaseColor.transparent,
        title: Icon(FontAwesomeIcons.twitter,color: BaseColor.blue2,),
        centerTitle: true,
      ),
      body: BlocListener<LoginBloc,LoginState>(
        listener: (context,state){
          if(state is LoginLoading){
            Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Log In..'),));
          }
          if(state is LoginSuccess){
            Navigator.pushReplacementNamed(context, rHomeScreen);
          }
          if(state is LoginFailure){
            Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.msg),));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          child: ListView(
            children: [
              Center(
                child: Text('Login to your account',style: TextStyle(color: BaseColor.white,fontSize: 26,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),
              BuildTextFormField(
                hint: 'Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _email,
              ),
              BuildTextFormField(
                hint: 'Password',
                textEditingController: _password,
                isObscure: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}