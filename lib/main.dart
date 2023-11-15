import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lawbo/firebase_options.dart';
import 'package:lawbo/providers/profile_provider.dart';
import 'package:lawbo/providers/signin_provider.dart';
import 'package:lawbo/providers/signup_provider.dart';
import 'package:lawbo/providers/user_provider.dart';
import 'package:lawbo/screens/splash%20screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
        child: const MyApp(),
      ),
      ChangeNotifierProvider(
        create: (context) => SignInProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
      ),
    ],
    child: const MyApp(),
  ));
  const MyApp();
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LawBo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
