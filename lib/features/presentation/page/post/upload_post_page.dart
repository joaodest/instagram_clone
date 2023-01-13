import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';

class UploadPostPage extends StatelessWidget {
  const UploadPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("UploadPost", style: TextStyle(color: primaryColor),),),
    );
  }
}