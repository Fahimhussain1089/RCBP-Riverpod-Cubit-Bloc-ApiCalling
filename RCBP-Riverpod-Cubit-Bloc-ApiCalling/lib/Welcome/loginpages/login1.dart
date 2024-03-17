import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/Welcome/bloc/sign_in_bloc.dart';
import 'package:practice/Welcome/loginpages/login2.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top: 550),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(

            padding: const EdgeInsets.all(8.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoButton.filled(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(
                      builder:(context) =>  BlocProvider(
                       create: (context) => SignInBloc(),
                          child: page2(),
                      ),
                  ),);
                },
                child: const Text('Sign in with Email'),
              ),
              SizedBox(height: 5),
              CupertinoButton.filled(
                onPressed: () {},
                child: const Text('Sign in with Google'),
              ),
            ],
                ),
          ),
        ),
      ),


    );
  }
}
