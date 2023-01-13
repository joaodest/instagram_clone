import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Search", style: TextStyle(color: primaryColor),),),
    );
  }
}