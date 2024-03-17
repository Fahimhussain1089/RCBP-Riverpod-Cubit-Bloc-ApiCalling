import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final countstateProvider= Provider<int>(
        (ref) => 0,
);

class CounterWidget extends ConsumerWidget {
  const CounterWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('CounterApp',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.black, ),


        ),
        backgroundColor: Colors.blue,
      ),
      body: Consumer(
        builder: (context,ref,child){
          int count = ref.watch(countstateProvider);
          return Center(child: Text(
            count.toString(),
            style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color:Colors.purple ),
          ),
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        //  ref.read(countstateProvider).state++;// this increment method is deprecated now

          },
        child: const Icon(Icons.add),
      ),
    );
  }
}