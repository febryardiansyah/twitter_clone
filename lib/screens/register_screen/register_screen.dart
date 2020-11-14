import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/bloc/register_bloc/register_bloc.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/utils/base_color.dart';
import 'package:twitter_clone/widgets/build_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        backgroundColor: BaseColor.blue3,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                  color: BaseColor.blue1,
                  child: Text('Register',style: TextStyle(color: BaseColor.white),),
                  onPressed: ()async{
                    context.bloc<RegisterBloc>().add(DoRegister(
                      name: _fullName.text,email: _email.text,password: _password.text,username: _username.text,
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          backgroundColor: BaseColor.transparent,
          title: Icon(FontAwesomeIcons.twitter,color: BaseColor.blue2,),
          centerTitle: true,
        ),
        body: BlocListener<RegisterBloc,RegisterState>(
          listener: (context,state){
            if(state is RegisterLoading){
              Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('registering....'),));
            }
            if(state is RegisterFailure){
              Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.msg),));
            }
            if(state is RegisterSuccess){
              Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.msg),));
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            child: ListView(
              children: [
                Center(
                  child: Text('Create your account',style: TextStyle(color: BaseColor.white,fontSize: 26,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 20,),
                BuildTextFormField(
                  hint: 'Full Name',
                  textEditingController: _fullName,
                ),
                BuildTextFormField(
                  hint: 'Username',
                  textEditingController: _username,
                ),
                BuildTextFormField(
                  hint: 'Email',
                  textEditingController: _email,
                  textInputType: TextInputType.emailAddress,
                ),
                BuildTextFormField(
                  hint: 'Password',
                  isObscure: true,
                  textEditingController: _password,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}