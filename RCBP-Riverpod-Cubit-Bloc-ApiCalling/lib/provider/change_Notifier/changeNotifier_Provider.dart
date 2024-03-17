import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/provider/change_Notifier/userNotifier.dart';

class changeNotifierProvider extends ConsumerWidget {
  const changeNotifierProvider({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier provider'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Consumer(
          builder: (context,ref,child){
           var data =  ref.watch(userProvider);
           return Text(
             data.userName,
             style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.deepPurple),
           );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(userProvider.notifier).arjunrampur();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
