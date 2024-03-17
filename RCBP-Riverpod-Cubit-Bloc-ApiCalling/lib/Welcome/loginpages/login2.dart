import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/Welcome/bloc/sign_in_bloc.dart';
import 'package:practice/Welcome/bloc/sign_in_event.dart';
import 'package:practice/Welcome/bloc/sign_in_state.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
 // TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'TutorialKart',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                ),),

            BlocBuilder<SignInBloc,SignInState>(
              builder: (context,state) {
                if(state is SignInErrorState){
                  return Text(
                    state.errorMerrage,
                    style: TextStyle(
                        color: Colors.redAccent
                    ),
                  );

                }else{ return Container();}

              }
            ),

            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                        emailController.text,
                        passwordController.text
                    )
                  );
                  
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text,
                          passwordController.text
                      )
                  );

                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: BlocBuilder<SignInBloc,SignInState>(
                  builder: (context,state) {
                    if(state is SignInLoadingState) {
                      Text("this is SignInLoading state working");
                      return Center(
                          child: CircularProgressIndicator());
                    };
                    return CupertinoButton(
                      child: const Text('Login'),
                      onPressed: () {
                        // print(nameController.text);
                        // print(passwordController.text);
                        if(state is SignInInvalidState){
                          BlocProvider.of<SignInBloc>(context).add(
                              SignInSubmittedEvent(
                                  emailController.text,
                                  passwordController.text
                              )
                          );
                        }

                      },
                      color: (state is SignInInvalidState) ? Colors.blue
                      : Colors.grey,
                    );
                  }
                )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
