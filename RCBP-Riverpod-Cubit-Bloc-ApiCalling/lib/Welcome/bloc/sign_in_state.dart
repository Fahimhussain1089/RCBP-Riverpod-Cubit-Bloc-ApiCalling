abstract class SignInState{}

class SignInInitialState extends SignInState{}

class SignInInvalidState extends SignInState{}

class SignInErrorState extends SignInState{
  final String errorMerrage;
  SignInErrorState(this.errorMerrage);
}
class SignInLoadingState extends SignInState{}

