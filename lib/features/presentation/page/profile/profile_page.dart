import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/page/profile/edit_profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text(
          "Username",
          style: TextStyle(color: primaryColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                _openBottomModalSheet(context);
              },
              child: Icon(
                Icons.menu,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: secondaryColor, shape: BoxShape.circle),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          sizeVer(8),
                          Text(
                            "Posts",
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                      sizeHor(20),
                      Column(
                        children: [
                          Text(
                            "54",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          sizeVer(8),
                          Text(
                            "Followers",
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                      sizeHor(20),
                      Column(
                        children: [
                          Text(
                            "122",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          sizeVer(8),
                          Text(
                            "Following",
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              sizeVer(10),
              Text("Name", style: TextStyle(
                  color: primaryColor, fontWeight: FontWeight.bold),),
              sizeVer(10),
              Text("User bio", style: TextStyle(color: primaryColor),),
              sizeVer(10),
              GridView.builder(
                itemCount: 32,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) =>
                    Container(
                      width: 100,
                      height: 100,
                      color: secondaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _openBottomModalSheet(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) {
      return Container(
        margin: EdgeInsets.only(left: 4, right: 4, bottom: 4),
        decoration: BoxDecoration(color: backGroundColor.withOpacity(.8)),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "More Options",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: primaryColor
                    ),
                  ),
                ),
                sizeVer(12),
                Padding(padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, PageConst.editProfilePage);
                    },
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: primaryColor
                      ),
                    ),
                  ),
                ),
                sizeVer(12),
                Padding(padding: EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: (){
                      BlocProvider.of<AuthCubit>(context).loggedOut();
                      Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false);
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: primaryColor
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
