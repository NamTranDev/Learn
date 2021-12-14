import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/home/main_screen.dart';
import 'package:ecommerce/screens/login_success/login_success_screen.dart';
import 'package:ecommerce/screens/otp/otp_screen.dart';
import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

// Define list route name
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
