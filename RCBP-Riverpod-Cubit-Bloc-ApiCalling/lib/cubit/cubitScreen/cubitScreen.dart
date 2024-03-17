import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/cubit/internet_cubit.dart';

class cubitScreen extends StatelessWidget {
  const cubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:BlocConsumer<InternetCubit,InternetState>(
          listener:(context,state){
            if(state == InternetState.Gained){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Internet Coneccted!!"),
                  backgroundColor: Colors.green,
                ),
              );
            }
            else if (state == InternetState.Lost){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Internet discontected-!!'),
                    backgroundColor: Colors.red,
                  )
              );
            }

          },
          builder: (context,state){
            if(state == InternetState.Gained){ //yan pe value compare ho rhi hai.
              return Text("connected!");
            }
            else if(state == InternetState.Lost){ //yan pe value compare ho rhi hai.
              return Text("Not Connected!");
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
