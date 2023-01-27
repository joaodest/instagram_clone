import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/get_single_user_usecase.dart';
import 'package:instagram_clone/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/user_cubit.dart';
import 'package:instagram_clone/features/presentation/page/credential/sign_up_page.dart';
import 'package:instagram_clone/features/presentation/page/main_screen/main_screen.dart';
import 'package:instagram_clone/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/injection_container.dart' as di;

import 'features/presentation/cubit/auth/auth_cubit.dart';
import 'features/presentation/page/credential/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider(create: (_) => di.sl<UserCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleUserCubit>()),
      ],
      child: MaterialApp(
        title: "Instagram Clone",
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if(authState is Authenticated){
                  return MainScreen(uid: authState.uid);
                } else {
                  return SignInPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
