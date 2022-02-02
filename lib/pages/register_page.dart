import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instgramclone/pages/login_page.dart';
import 'package:instgramclone/services/auth/auth.dart';
import 'package:instgramclone/utils/colors.dart';
import 'package:instgramclone/utils/shared/box_field.dart';
import 'package:instgramclone/utils/strings.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController biocontroller = TextEditingController();
  late final Uint8List userimage;
  bool _isLoading = false;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    namecontroller.dispose();
    biocontroller.dispose();
    super.dispose();
  }

  // pick image from gallery
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No Image Selected');
  }

  void selectimage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      userimage = image;
    });
  }

  sendRegisterData() async {
    setState(() {
      _isLoading = true;
    });
    String res = await ResgisterAuth().registerUser(
        file: userimage,
        name: namecontroller.text,
        bio: biocontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text);
    if (kDebugMode) {
      print(res);
    }
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
    } else {
      return // show the error
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: MediaQuery.of(context).size.width > webScreenSize
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3)
                : EdgeInsets.only(
                    right: 32,
                    left: 32,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Flexible(
                    //   child: Container(),
                    //   flex: 2,
                    // ),
                    SvgPicture.asset(
                      'assets/instagram.svg',
                      color: kprimaryColor,
                      height: 64,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Stack(
                      children: [
                        userimage != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: MemoryImage(
                                  userimage,
                                ))
                            : const CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage('assets/default image .png')
                                //  NetworkImage(
                                //   'https://images.unsplash.com/photo-1643635584824-993e275ef1ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                                // ),
                                ),
                        Positioned(
                            bottom: -8,
                            left: 80,
                            child: IconButton(
                                onPressed: () {
                                  selectimage();
                                },
                                icon: const Icon(Icons.add_a_photo,
                                    color: Colors.grey)))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    BoxTextField(
                        controller: namecontroller,
                        keyboardType: TextInputType.name,
                        hintText: 'Enter your Name'),
                    const SizedBox(
                      height: 25,
                    ),
                    BoxTextField(
                        controller: biocontroller,
                        keyboardType: TextInputType.text,
                        hintText: 'You Bio'),
                    const SizedBox(
                      height: 25,
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
                        onPressed: sendRegisterData,
                        child: Center(
                            child: _isLoading == false
                                ? const Text('Register')
                                : const CircularProgressIndicator())),
                    const SizedBox(
                      height: 12,
                    ),
                    // Flexible(
                    //   child: Container(),
                    //   flex: 2,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('have an account?'),
                          TextButton(
                              onPressed: () {
                                Get.to(const LoginPage());
                              },
                              child: const Text('Login'))
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
