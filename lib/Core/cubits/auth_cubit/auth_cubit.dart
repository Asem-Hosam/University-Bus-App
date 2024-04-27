import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaapp/View/Screens/admin/admin_screen.dart';
import 'package:sinaapp/View/Screens/profile_screen.dart';
import 'package:sinaapp/View/Screens/search_screen.dart';
import 'package:sinaapp/View/Screens/tickets_screens.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(UiUpadateInitial());

  bool isSecure = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  bool isAdmin = false;

  List<Widget> activeScreen = [
    const SearchScreen(),
    const TicketsScreen(),
    const ProfileScreen(),
  ];
  int activeScreenIndex = 0;

  void signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      QuerySnapshot<Object?> userQuerySnapshot =
          await users.where("id", isEqualTo: userCredential.user!.uid).get();
      if (userQuerySnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot<Object?> userDoc = userQuerySnapshot.docs.first;
        final role = userDoc['role'];
        if (role == 'Admin' || role == 'Student') {
          if (role == 'Admin') {
            activeScreen.insert(2, const AdminScreen());
            isAdmin = true;
          } else {
            activeScreen.removeWhere((widget) => widget is AdminScreen);
            isAdmin = false;
          }
          emit(LoginSuccess(role: role));
        } else {
          emit(LoginFailure(errorMessage: 'Invalid user role'));
        }
      } else {
        emit(LoginFailure(errorMessage: 'User document not found'));
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'This account does not exist'));
      } else if (ex.code == 'wrong-password' || ex.code == 'invalid-email') {
        emit(LoginFailure(errorMessage: 'Invalid email or password'));
      } else {
        emit(
            LoginFailure(errorMessage: 'Authentication failed: ${ex.message}'));
      }
    } catch (e) {
      print('Error signing in: $e');
      emit(LoginFailure(errorMessage: 'An unexpected error occurred.'));
    }
  }

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  void createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String mobile,
    required String username,
  }) async {
    emit(SginupLoading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;
      await users
          .add({
            "id": uid,
            'email': email,
            'mobile': mobile,
            'username': username,
            'password': password,
            'role': "Student",
          })
          .then((value) => print("users Added"))
          .catchError(
            (err) => {print("theres an ${err}")},
          );

      print(userCredential);
      emit(SginupSucces());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'email-already-in-use') {
        emit(SginupFailure(errorMessage: 'This account is Already Exsit'));
      } else if (ex.code == 'weak-password' || ex.code == 'invalid-email') {
        emit(SginupFailure(
            errorMessage: "Sorry, the password is Weak or Use another Email"));
      }
    } catch (e) {
      print("Error signing in: $e");
      emit(SginupFailure(errorMessage: "other Type of Erorr"));
    }
  }

  void isPaswordSecure() {
    isSecure = !isSecure;
    emit(IsSecurePasswordCheck());
  }

  Future<void> onTabChange(val) async {
    emit(UiUpadateInitial());
    activeScreenIndex = val;
  }
}
