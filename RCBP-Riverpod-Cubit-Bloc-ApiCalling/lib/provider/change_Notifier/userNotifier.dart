import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userProvider  = ChangeNotifierProvider<User>(
      (ref) => User(),
);
class User extends ChangeNotifier{
  String userName = 'sumit Rathor';

   void arjunrampur(){
     userName = "soniya mirja";
     notifyListeners();
   }
}