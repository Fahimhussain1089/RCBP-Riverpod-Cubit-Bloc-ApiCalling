import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderCWM extends StatelessWidget {
  const ProviderCWM({super.key});

  @override
  Widget build(BuildContext context) {
    String Data =  Provider.of<String>(context);
    return  Scaffold(
      body:  Center(
        child: Text(
          Data,
          style: const TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.purple),
        ),
      ),
    )  ;
  }
}
