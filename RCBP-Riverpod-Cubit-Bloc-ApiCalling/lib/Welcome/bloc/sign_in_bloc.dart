import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:practice/Welcome/bloc/sign_in_event.dart';
import 'package:practice/Welcome/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc() : super(SignInInitialState()){
    on<SignInTextChangedEvent>((event, emit){
      if(event.emailValue == "" && EmailValidator.validate(event.emailValue) == false){
        emit(SignInErrorState("Please enter a valid email address"));
      }else if(event.passwordValue.length<8){
        emit(SignInErrorState("Please enter a valid password"));

      }else{emit(SignInInvalidState() );}
    });
    on<SignInSubmittedEvent>((even,emit){
    emit(SignInLoadingState() );
    });
  }
}