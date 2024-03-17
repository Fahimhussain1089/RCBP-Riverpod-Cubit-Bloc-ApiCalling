import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/phone_Auth/authwithcubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  final FirebaseAuth _auth  = FirebaseAuth.instance;

  AuthCubit() : super( AuthInitialState() ) {
    User? currentUser = _auth.currentUser;
    if(currentUser != null) {
      emit( AuthLoggedInState(currentUser) );
    }
    else {
      emit( AuthLoggedOutState() );
    }
  }

  String? _verificationId; // verificationId krene ke liye store krenge "codeSent me infuture me verification

  // we will create methode
  void sendOTP(String phoneNumber) async{
     emit(AuthLoadingState()); //ye dosrri state loding hogi usi time

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (verificationId,forceResendingToken){
          _verificationId = verificationId;   //ko store kr liya
          emit( AuthCodeSendState() );
        },
        verificationCompleted: (phoneAuthCredential){  //autometic otp fetch hoga
          signInWithPhone(phoneAuthCredential);  //ye redirect ke dega last wale method me
        },
        verificationFailed: (error){
          emit( AuthErrorState(error.message.toString()) ); //ye error show krega
        },
        codeAutoRetrievalTimeout: (verificationId){     //otp time khatam
          _verificationId = verificationId; //jo otp aya. use humne store kiya or match kiya.
        }
    );
  }

  void verifyOTP(String otp) async{
    emit(AuthLoadingState()); //ye dosrri state loding hogi usi time
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId! , smsCode: otp );
        signInWithPhone(credential);//ye redirect ke dega last method ko
  }

  void signInWithPhone(PhoneAuthCredential credential) async{
    try{
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      if(userCredential.user != null){
        emit( AuthLoggedInState(userCredential.user!) ); //dosrri  event trigger hoga
      }


    }on FirebaseAuthException catch(ex){
      emit( AuthErrorState(ex.message.toString()) );

    }
  }
  void logOut() async {
    await _auth.signOut();
    emit( AuthLoggedOutState() );
  }
}