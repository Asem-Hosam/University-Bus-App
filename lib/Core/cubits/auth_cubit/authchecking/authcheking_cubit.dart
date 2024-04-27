import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'authcheking_state.dart';

class AuthchekingCubit extends Cubit<AuthchekingState> {
  AuthchekingCubit() : super(IsAuthenticated());

  initSarts() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          emit(IsAuthenticated());
          print("We Are Logged in $user");
        } else {
          emit(UnAuthenticated());
          print("We Are Logged Out");
        }
      });
    } catch (ex) {
      print("Erorr $ex");
    }
  }
}
