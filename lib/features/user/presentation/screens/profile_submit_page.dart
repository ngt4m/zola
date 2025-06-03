import 'dart:io';
import 'package:flutter/material.dart';
import 'package:what_chat/app/constant/page_const.dart';
import 'package:what_chat/app/global/widgets/profile_widget.dart';
import 'package:what_chat/app/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:what_chat/home/home_page.dart';

class ProfileSubmitPage extends StatefulWidget {
 
  const ProfileSubmitPage({Key? key,  })
      : super(key: key);

  @override
  _ProfileSubmitPageState createState() => _ProfileSubmitPageState();
}

class _ProfileSubmitPageState extends State<ProfileSubmitPage> {
  File? image;
  final TextEditingController _usernameController = TextEditingController();
  Future SelectImage() async {
    try {
      final pickImage = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);
      setState(() {
        if (pickImage != null) {
          image = File(pickImage.path);
        } else {
          print("no image has been selected");
        }
      });
    } catch (e) {
      throw ("Some error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Profile Info",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: tabColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please provide your name and an optional profile photo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: blackColor),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: SelectImage,
              child: SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: ProfileWidget(image: image),
                ),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: tabColor, width: 1.5))),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: greyColor),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: blackColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                // Navigator.pushNamed(context, PageConst.homePage);
              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: tabColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // void SubmitProfileInfor(){
  //     Bloc
  // }
}
