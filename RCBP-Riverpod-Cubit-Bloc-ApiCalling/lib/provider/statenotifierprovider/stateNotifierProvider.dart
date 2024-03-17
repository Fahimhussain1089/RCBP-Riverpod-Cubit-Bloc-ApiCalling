import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/provider/statenotifierprovider/counterNotifier.dart';

class stateNotifierProvider extends ConsumerWidget {
  const stateNotifierProvider({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    int count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier provider'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterProvider.notifier).hussain();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
