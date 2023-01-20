import 'package:flutter/material.dart';
import 'package:instagram_clone/features/presentation/page/credential/sign_up_page.dart';
import 'package:instagram_clone/features/presentation/page/main_screen/main_screen.dart';
import 'package:instagram_clone/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/presentation/page/credential/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Instagram Clone",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      onGenerateRoute: OnGenerateRoute.route,
      initialRoute: "/",
      routes: {
        "/" : (context){
          return MainScreen();
        }
      },
    );
  }
}
