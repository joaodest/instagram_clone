import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/page/profile/widgets/profile_form_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text("Edit Profile"),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.close,
              size: 32,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.done, color: blueColor, size: 32),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(60)),
              ),
            ),
            sizeVer(15),
            Center(
              child: Text(
                "Change profile photo",
                style: TextStyle(
                    color: blueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            sizeVer(15),
            ProfileFormWidget(
              title: "Name",
            ),
            sizeVer(15),
            ProfileFormWidget(
              title: "Username",
            ),
            sizeVer(15),
            ProfileFormWidget(
              title: "Website",
            ),
            sizeVer(15),
            ProfileFormWidget(
              title: "Bio",
            )
          ],
        ),
      ),
    );
  }
}
