import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/phone_Auth/authwithcubit/auth_cubit.dart';
import 'package:practice/phone_Auth/authwithcubit/auth_state.dart';
import 'package:practice/phone_Auth/sign_in_screen.dart';

class homeScreen3 extends StatelessWidget {
  const homeScreen3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(

            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {

                if(state is AuthLoggedOutState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context, CupertinoPageRoute(
                      builder: (context) => SignInScreen()
                  ));
                }

              },
              builder: (context, state) {
                return CupertinoButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logOut();
                  },
                  child: Text("Log Out"),
                );
              },
            ),

          ),
        ),
      ),
    );
  }
}
