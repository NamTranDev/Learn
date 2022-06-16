import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/repository/authen.dart';
import 'package:instagram/screens/sign_up_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/utils.dart';
import 'package:instagram/widgets/text_field_input.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  void _signInUser() async {
    setState(() {
      _isLoading = true;
    });

    String result = await Authen().loginUser(
        email: _emailController.text, password: _passController.text);

    setState(() {
      _isLoading = false;
    });

    if (result != 'success') {
      showSnackBar(context, result);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            //svg iamge
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              height: 64,
              color: primaryColor,
            ),
            const SizedBox(
              height: 64,
            ),
            //text field input for email
            TextFieldInput(
                controller: _emailController,
                hintText: "Input Your Email",
                inputType: TextInputType.emailAddress),
            const SizedBox(
              height: 24,
            ),
            //text field input for password
            TextFieldInput(
              controller: _passController,
              hintText: "Input Your Password",
              inputType: TextInputType.text,
              actionInput: TextInputAction.done,
              isPass: true,
            ),
            const SizedBox(
              height: 32,
            ),
            //button login
            InkWell(
              onTap: _signInUser,
              child: Container(
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: primaryColor,
                      )
                    : const Text("Sign In"),
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor),
              ),
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            //transitioning to signing up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Don't have an account?"),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  }),
                  child: Container(
                    child: Text(
                      "Sign Up.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
