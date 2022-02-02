import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instgramclone/pages/register_page.dart';
import 'package:instgramclone/utils/colors.dart';
import 'package:instgramclone/utils/shared/box_field.dart';
import 'package:instgramclone/utils/shared/desmissible_key.dart';
import 'package:instgramclone/utils/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.only(
                  right: 32,
                  left: 32,
                ),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                SvgPicture.asset(
                  'assets/instagram.svg',
                  color: kprimaryColor,
                  height: 64,
                ),
                const SizedBox(
                  height: 64,
                ),
                BoxTextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your Email'),
                const SizedBox(
                  height: 25,
                ),
                BoxTextField(
                    controller: passwordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    obsecure: true,
                    hintText: 'Enter your Password'),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kblueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {},
                    child: const Center(child: Text('Login'))),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont have an account?'),
                      TextButton(
                          onPressed: () {  Get.to(const RegisterPage());}, child: const Text('Register'))
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
