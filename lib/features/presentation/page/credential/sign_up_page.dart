import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:instagram_clone/features/presentation/page/credential/sign_in_page.dart';
import 'package:instagram_clone/features/presentation/page/main_screen/main_screen.dart';
import 'package:instagram_clone/features/presentation/widgets/button_container_widget.dart';
import 'package:instagram_clone/features/presentation/widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  bool _isSigningUp = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            toast("Invalid Email or Password");
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(uid: authState.uid);
                } else {
                  return _bodyWidget();
                }
              },
            );
          }
          return _bodyWidget();
        },
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Center(
            child: SvgPicture.asset(
              "images/ic_instagram.svg",
              color: primaryColor,
            ),
          ),
          sizeVer(15),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Image.asset("images/profile_default.png"),
                ),
                Positioned(
                  right: -10,
                  bottom: -15,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
          ),
          sizeVer(30),
          FormContainerWidget(
            controller: _usernameController,
            hintText: "Username",
          ),
          sizeVer(12),
          FormContainerWidget(
            controller: _emailController,
            hintText: "Email",
          ),
          sizeVer(12),
          FormContainerWidget(
            controller: _passwordController,
            hintText: "Password",
            isPasswordField: true,
          ),
          sizeVer(12),
          FormContainerWidget(
            controller: _bioController,
            hintText: "Bio",
          ),
          sizeVer(15),
          ButtonContainerWidget(
            color: blueColor,
            text: "Sign Up",
            onTapListener: () {
              _signUpUser();
            },
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Divider(
            color: secondaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: primaryColor),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.signInPage, (route) => false);
                },
                child: Text(
                  "Sign In.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
              )
            ],
          ),
          sizeVer(10),
          _isSigningUp == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please wait",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    sizeHor(10),
                    CircularProgressIndicator(),
                  ],
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
        ],
      ),
    );
  }

  void _signUpUser() {
    setState(() {
      _isSigningUp = true;
    });
    BlocProvider.of<CredentialCubit>(context).signUpUser(
          user: UserEntity(
            email: _emailController.text,
            password: _passwordController.text,
            bio: _bioController.text,
            username: _usernameController.text,
            totalPosts: 0,
            totalFollowing: 0,
            followers: [],
            totalFollowers: 0,
            profileUrl: "",
            website: "",
            following: [],
            name: "",
          ),
        )
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      _usernameController.clear();
      _emailController.clear();
      _bioController.clear();
      _passwordController.clear();
      _isSigningUp = false;
    });
  }
}
