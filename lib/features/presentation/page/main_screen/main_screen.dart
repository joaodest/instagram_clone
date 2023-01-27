import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/page/activity/activity_page.dart';
import 'package:instagram_clone/features/presentation/page/home/home_page.dart';
import 'package:instagram_clone/features/presentation/page/post/upload_post_page.dart';
import 'package:instagram_clone/features/presentation/page/profile/profile_page.dart';
import 'package:instagram_clone/features/presentation/page/search/search_page.dart';


class MainScreen extends StatefulWidget {

  final String uid;
  const MainScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState(){
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index){
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: CupertinoTabBar(
          backgroundColor: backGroundColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: primaryColor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
                color: primaryColor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_outlined,
                color: primaryColor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: primaryColor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: primaryColor,
              ),
              label: "",
            ),
          ],
          onTap: navigationTapped,
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          SearchPage(),
          UploadPostPage(),
          ActivityPage(),
          ProfilePage()
        ],
        onPageChanged: onPageChanged,
      ),
    );
  }
}
