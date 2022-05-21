import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';
import 'package:get_fit/presentation/screens/home_screen.dart';
import 'package:get_fit/presentation/screens/intro_screens/AuthController/auth_cubit.dart';
import 'package:get_fit/presentation/screens/intro_screens/signup_screen.dart';
import 'package:get_fit/presentation/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/text_styles.dart';
import '../../../core/Magic Route/router.dart';
import '../../widgets/custom_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginFailedState) {
              showSnackBar(
                  msg: state.msg, snackBarStates: SnackBarStates.error);
            }
            if (state is LoginSuccessState) {
              showSnackBar(
                  msg: 'Login Successfully',
                  snackBarStates: SnackBarStates.success);
              MagicRouter.navigateAndPopAll(const HomeScreen());
            }
          },
          builder: (context, state) {
            final cubit = AuthCubit.get(context);

            return ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: width(15), vertical: height(100)),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Log In',
                  style: registerScreensTitle,
                ),
                const Space(boxHeight: 100),
                // padding: const EdgeInsets.all(10),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    labelText: 'Email',
                    labelStyle: labelTextField,
                  ),
                ),
                const Space(
                  boxHeight: 20,
                ),
                TextField(
                    obscureText: _isObscure,
                    controller: passwordController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () => setState(() {
                            _isObscure = !_isObscure;
                          }),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Password',
                        labelStyle: labelTextField)),
                // ignore: deprecated_member_use
                const Space(
                  boxHeight: 70,
                ),
                MainButton(
                    text: 'Login', onPressed: () => cubit.loginWithEmail()),
                const Space(
                  boxHeight: 50,
                ),

                Center(
                  child: Text(
                    'Or Log in with',
                    style: labelTextField,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: screenHeight * 0.055,
                        child: Lottie.asset('assets/lotties/facebook.json')),
                    const Space(
                      boxWidth: 15,
                    ),
                    SizedBox(
                        height: screenHeight * 0.055,
                        child: Lottie.asset('assets/lotties/google.json')),
                  ],
                ),
                const Space(
                  boxHeight: 30,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Does not have account?',
                      style: labelTextField,
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      textColor: Colors.blue,
                      child: const Text(
                        'SignUp',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Get.offAll(const SignupPage());
                        //signup screen
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
