import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

enum InternetState{Initial,Lost,Gained}
class InternetCubit extends Cubit<InternetState>{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubsciption; //ye null bhi ho sakta hai

  InternetCubit()  : super(InternetState.Initial){
    connectivitySubsciption =   _connectivity.onConnectivityChanged.listen((result){
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        emit(InternetState.Gained);
      }
      else{emit (InternetState.Lost);}
    });
  }
  @override
  Future<void> close() {
    connectivitySubsciption?.cancel();
    return super.close();
  }
}