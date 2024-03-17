import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/blocks/internet_block/internet_event.dart';
import 'package:practice/blocks/internet_block/internet_state.dart';



class InternetBloc extends Bloc<InternetEvent,InternetState>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super( InternetInitialState()){

  on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
  on<InternetGainEvent>((event, emit) => emit(InternetGainedState()));
  connectivitySubscription = _connectivity.onConnectivityChanged.listen((result){
    if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi)
      {
        add(InternetGainEvent());
      }else{
      add(InternetLostEvent());
     }
    });
  }
  @override
  Future<void> close(){
    connectivitySubscription?.cancel();
    return super.close();
  }

}