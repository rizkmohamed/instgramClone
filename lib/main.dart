import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instgramclone/pages/login_page.dart';

import 'package:instgramclone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDX_wzzI7F3_LURsuzPv9XoQ5FfhX36FXk",
            appId: "1:771932681722:web:5aad367cf30f2ba8526043",
            messagingSenderId: "771932681722",
            projectId: "instgramclone-cbd24",
            storageBucket: "instgramclone-cbd24.appspot.com"));
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Instgram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const LoginPage(),
    );
  }
}
