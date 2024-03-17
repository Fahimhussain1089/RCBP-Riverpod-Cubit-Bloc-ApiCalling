import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/main.dart';

final stringProvider = Provider<String>(
        (ref){
      return 'Flutter Riverpod testing no. 1 practice exceise';
    }
);//this is only read provider

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('hussain');
   String ourData =  ref.read<String>(stringProvider);

    return Scaffold(
      body:  Center(
            child: Text(
              ourData,
          style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.purple),
        ),
      ),
    )  ;
  }
}
