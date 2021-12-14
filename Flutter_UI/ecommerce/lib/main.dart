import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/home/main_screen.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:ecommerce/storage/preference.dart';
import 'package:ecommerce/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: firstRoute(),
      routes: routes,
    );
  }

  String firstRoute() {
    if (Preference.instance.isLogin()) {
      return MainScreen.routeName;
    } else {
      return SplashScreen.routeName;
    }
  }
}
