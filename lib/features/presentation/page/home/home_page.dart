import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: SvgPicture.asset(
          "images/ic_instagram.svg",
          color: primaryColor,
          height: 32,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(
              "images/messenger.png",
              color: primaryColor,
              width: 28,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    sizeHor(10),
                    Text("Username", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                  ],
                ),
                Icon(Icons.more_vert, color: primaryColor,)
              ],
            ),
            sizeVer(10),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30,
              color: secondaryColor,
            ),
            sizeVer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_outline, color: primaryColor,),
                    sizeHor(10),
                    GestureDetector(
                      child: Image.asset("images/bubble-chat.png", color: primaryColor, width: 25,),
                    ),
                    sizeHor(10),
                    GestureDetector(
                      child: Image.asset("images/send.png", color: primaryColor, width: 23,),
                    ),
                    sizeHor(10),
                  ],
                ),
                Icon(Icons.bookmark_outline, color: primaryColor,)
              ],
            ),
            sizeVer(10),
            Row(
              children: [
                Text("Username", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                sizeHor(8),
                Text("some description", style: TextStyle(color: primaryColor,),),
              ],
            ),
            sizeVer(10),
            Text("View all 10 comments", style: TextStyle(color: darkGreyColor,),),
            sizeVer(10),
            Text("08/5/2022", style: TextStyle(color: darkGreyColor,),),
          ],
        ),
      ),
    );
  }
}
