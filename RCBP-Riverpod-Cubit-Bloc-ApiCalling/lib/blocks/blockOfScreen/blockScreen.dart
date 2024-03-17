import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/blocks/internet_block/internet_block.dart';
import 'package:practice/blocks/internet_block/internet_state.dart';

class blockScreen extends StatelessWidget {
  const blockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:BlocConsumer<InternetBloc,InternetState>(
            listener:(context,state){
              if(state is InternetGainedState){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("Internet Coneccted!!"),
                    backgroundColor: Colors.green,
                  ),
                );
              }
              else if (state is InternetLostState){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Internet discontected-!!'),
                    backgroundColor: Colors.red,
                  )
                );
              }

            },
            builder: (context,state){
              if(state is InternetGainedState){
                return Text("connected!");
              }
              else if(state is InternetLostState){
                 return Text("--Not Connected!");
              }
              else {
                  return Text('Loading.....');
                }
              },
            ),
        // child: BlocBuilder<InternetBloc,InternetState>(
        //   builder: (context,state){

        //
        //   }
        // ),
      ),
    );
  }
}
