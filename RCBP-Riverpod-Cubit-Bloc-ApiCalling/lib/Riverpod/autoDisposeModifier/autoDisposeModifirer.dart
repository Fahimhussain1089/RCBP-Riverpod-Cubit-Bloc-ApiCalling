import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/provider/statenotifierprovider/counterNotifier.dart';

final counterStateProvider = StateProvider.autoDispose<int>(
    (ref) => 0,
);
class autoDisposeModifier extends ConsumerWidget {
  const autoDisposeModifier({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier provider'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer(
        builder: (context,ref,child){
          int count = ref.watch(counterStateProvider);
          return Text(
          count.toString(),
          style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green),
           );
         },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterStateProvider.state).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
