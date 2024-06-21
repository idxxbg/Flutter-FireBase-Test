import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stack_app/chat/chat_page.dart';
import 'package:flutter_stack_app/login_screen/services/authentication.dart';
import 'package:flutter_stack_app/login_screen/widget/my_button.dart';
import 'package:flutter_stack_app/login_screen/widget/snack_bar.dart';
import 'package:flutter_stack_app/login_screen/widget/text_field.dart';
import 'package:lottie/lottie.dart';
import 'firebase_options.dart';

part 'login_screen/Screen/login_screen.dart';
part 'login_screen/Screen/sign_up.dart';
part 'login_screen/Screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          }),
    );
  }
}
