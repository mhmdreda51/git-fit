import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../widgets/custom_snack_bar.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  //===============================================================

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

//===============================================================
  void signOut() async {
    emit(SignOutLoading());
    try {
      await firebaseAuth.signOut();
      showSnackBar(msg: 'Signed out', snackBarStates: SnackBarStates.success);
      // MagicRouter.navigateAndPopAll(const LoginView());
      emit(SignOutSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      showSnackBar(
          msg: e.code.toString(), snackBarStates: SnackBarStates.error);
      emit(SignOutFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      showSnackBar(msg: e.toString(), snackBarStates: SnackBarStates.error);
      emit(SignOutFailed());
    }
  }

//===============================================================
  void loginWithEmail() async {
    emit(LoginLoadingState());
    try {
      if (!loginFormKey.currentState!.validate()) {
        emit(AuthInitial());
        return;
      }
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: loginEmailController.text.trim().toLowerCase(),
        password: loginPasswordController.text.trim(),
      );
      print(userCredential.user);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailedState(msg: e.message.toString()));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(LoginFailedState(msg: e.toString()));
    }
  }

//===============================================================
  TextEditingController signUpFirstNameController = TextEditingController();
  TextEditingController signUpLastNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();

//===============================================================
  void signUpWithEmail() async {
    emit(SignUpLoadingState());
    try {
      if (!signUpFormKey.currentState!.validate()) {
        emit(AuthInitial());
        return;
      }
      if (signUpEmailController.text != signUpPasswordController.text) {
        showSnackBar(
            msg: 'Make sure that password is the same',
            snackBarStates: SnackBarStates.warning);
        emit(AuthInitial());
        return;
      }
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: signUpEmailController.text.trim().toLowerCase(),
        password: signUpPasswordController.text.trim(),
      );
      print(userCredential.user);
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailedState(msg: e.message.toString()));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(SignUpFailedState(msg: e.toString()));
    }
  }
//===============================================================

}
