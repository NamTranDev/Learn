import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/repository/authen.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? avarta;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      avarta = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    var result = await Authen().signUpUser(
        userName: _usernameController.text,
        email: _emailController.text,
        pass: _passController.text,
        bio: _bioController.text,
        avarta: avarta);
    print(result);

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              //svg iamge
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                height: 64,
                color: primaryColor,
              ),
              const SizedBox(
                height: 32,
              ),
              //circle widget for avarta
              Stack(
                children: [
                  avarta != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(avarta!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              "https://t3.ftcdn.net/jpg/02/09/37/00/360_F_209370065_JLXhrc5inEmGl52SyvSPeVB23hB6IjrR.jpg"),
                        ),
                  Positioned(
                    child: IconButton(
                      onPressed: (() {
                        selectImage();
                      }),
                      icon: Icon(Icons.add_a_photo),
                    ),
                    bottom: -10,
                    left: 80,
                  )
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              //text field input for username
              TextFieldInput(
                  controller: _usernameController,
                  hintText: "Input your username",
                  inputType: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //text field input for email
              TextFieldInput(
                  controller: _emailController,
                  hintText: "Input your email",
                  inputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              //text field input for password
              TextFieldInput(
                controller: _passController,
                hintText: "Input your password",
                inputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 32,
              ),
              //text input field for bio
              TextFieldInput(
                  controller: _bioController,
                  hintText: "Input your bio",
                  inputType: TextInputType.text,
                  actionInput: TextInputAction.done,),
              const SizedBox(
                height: 24,
              ),
              //button Sign Up
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : Text("Sign Up"),
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
            ],
          ),
        ),
      )),
    );
  }
}
