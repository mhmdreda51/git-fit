import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';
import 'package:get_fit/presentation/screens/home_screen.dart';
import 'package:get_fit/presentation/screens/intro_screens/AuthController/auth_cubit.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/text_styles.dart';
import '../../../core/Magic Route/router.dart';
import '../../widgets/custom_snack_bar.dart';
import '../../widgets/main_button.dart';
import '../../widgets/register_text_field.dart';
import 'login_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpFailedState) {
              showSnackBar(
                  msg: state.msg, snackBarStates: SnackBarStates.error);
            }
            if (state is SignUpSuccessState) {
              showSnackBar(
                  msg: 'SignUp Successfully',
                  snackBarStates: SnackBarStates.success);

              MagicRouter.navigateAndPopAll(const HomeScreen());
            }
          },
          builder: (context, state) {
            final cubit = AuthCubit.get(context);

            return ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: width(15), vertical: height(70)),
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //padding: EdgeInsets.all(15),
              children: <Widget>[
                Text(
                  'Create Your Account',
                  style: registerScreensTitle,
                ),
                const Space(
                  boxHeight: 40,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     NameTextFieldRegister(controller: firstNameController,hintName: "First Name"),
                //     NameTextFieldRegister(controller: lastNameController,hintName: "Last Name"),
                //   ],
                // ),
                // Space(boxHeight: 10,),
                RegisterTextField(
                    controller: emailController,
                    labelText: "User Name",
                    isSecure: false,
                    prefixIcon: Icons.person,
                    suffixVisible: false),
                RegisterTextField(
                    controller: emailController,
                    labelText: "Email",
                    isSecure: false,
                    prefixIcon: Icons.email_outlined,
                    suffixVisible: false),
                RegisterTextField(
                  controller: passwordController,
                  labelText: "Password",
                  isSecure: true,
                  prefixIcon: Icons.lock,
                  suffixVisible: true,
                ),
                RegisterTextField(
                  controller: confirmPassword,
                  labelText: "Confirm password",
                  isSecure: true,
                  prefixIcon: Icons.lock,
                  suffixVisible: true,
                ),

                const Space(
                  boxHeight: 40,
                ),
                MainButton(
                  text: 'Sign Up',
                  onPressed: () => cubit.signUpWithEmail(),
                ),
                const Space(
                  boxHeight: 15,
                ),
                Center(
                    child: TextButton(
                        onPressed: () {
                          Get.offAll(const LoginPage());
                        },
                        child: const Text(
                          "already i have an account",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ))),
                const Space(
                  boxHeight: 15,
                ),
                Center(
                  child: Text(
                    'Or Sign up with',
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
              ],
            );
          },
        ),
      )),
    );
  }
}
