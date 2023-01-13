import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Profile", style: TextStyle(color: primaryColor),),),
    );
  }
}