import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/provider/stream_provider/fetch_number.dart';

final numberProvider = StreamProvider<int>(
        (ref){
          return fetchNumber();
        }
);

class NumberScreem extends ConsumerWidget {
  const NumberScreem({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   var asyncvalue =  ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        title:Text('number'),backgroundColor: Colors.blue),
      body: asyncvalue.when(
          data: (data){
            return Center(
              child: Text(data.toString(),
              style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.purple),
              ),
            );
          },
          error: (error,stackTrace){
            return Center(
              child: Text(error.toString(),
              ),
            );
          },
          loading: (){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
