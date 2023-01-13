import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Activity", style: TextStyle(color: primaryColor),),),
    );
  }
}
