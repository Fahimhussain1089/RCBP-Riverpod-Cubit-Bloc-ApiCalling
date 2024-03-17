//import 'dart:io' if (dart.library.js) 'dart:js';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/apiCalling/screens/home_screen.dart';



//
// void main(List<String> args) {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//   ),
//   );
// }


////////////////////provider
//
// void main(List<String> args) {
//   runApp(Provider<String>(
//     create: (context) => "this is provider testing",
//     child: const MyApp(),
//   ),
//   );
// }
// /////////riverpodCWM
// void main(List<String> args) {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//   ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // home: HomeScreen(),
//       //home: ProviderCWM(),
//       // home: RiverpodCWM(),
//       //  home: CounterWidget(),
//       home: futureprovider(),
//
//     );
//   }
// }
//
///////////////////////future provider
void main(List<String> args) {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.blueGrey,

      body: Center(
      child: _buildButton(context),
      ),
    );
  }
  Widget _buildButton(BuildContext context){
    return ElevatedButton(
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(
         // builder: (context)  => const WeatherScreen(),
         // builder: (context)  => const NumberScreem(),
         // builder: (context)  => const stateNotifierProvider(),
         // builder: (context)  => const changeNotifierProvider(),
         // builder: (context)  => const autoDisposeModifier(),
         // builder: (context)  => const familyModifier(),
          builder: (context)  => const home_screen(),


        ),
      );
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.blue,),
        child: Text(
        //  'Future Provider',
          'Stream Provider testing',
          selectionColor: Colors.blue,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:Colors.white,
          ),
        ),

    );
  }
}

///practice of block
// void main(){
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return BlocProvider(
//       // create: (context) => InternetBloc(),
//       create: (context) => InternetCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         debugShowMaterialGrid: false,
//        // home: blockScreen(),
//         home: cubitScreen(),
//       ),
//     );
//   }
// }
//-----------------------------------------------
//
////phone verification
//form validattion
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform
//   );
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return BlocProvider(
//       create: (context)=> AuthCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: BlocBuilder<AuthCubit, AuthState>(
//           buildWhen: (oldState, newState) {
//             return oldState is AuthInitialState;
//           },
//           builder: (context, state) {
//             if(state is AuthLoggedInState) {
//               return homeScreen3();
//             }
//             else if(state is AuthLoggedOutState) {
//               return SignInScreen();
//             }
//             else {
//               return Scaffold();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }