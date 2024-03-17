import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fahimProvider1= Provider<String>(
        (ref) =>'this is riverpod provider testing');

final fahimProvider2= Provider<String>(
        (ref) =>'this is riverpod provider testing');

class RiverpodCWM extends ConsumerWidget {
  const RiverpodCWM({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    String data1 = ref.read(fahimProvider1);
    String data2 = ref.read(fahimProvider2);
    return Scaffold(
      body:  Center(
        child: Text(
          data1,

          style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.purple),
        ),
      ),
    );
  }
}
