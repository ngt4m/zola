import 'package:flutter/material.dart';
import 'package:what_chat/app/global/widgets/profile_widget.dart';
import 'package:what_chat/app/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(
            color: whiteColor,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 55,
                  width: 55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ProfileWidget(),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User name",
                        style: const TextStyle(fontSize: 15,
                        color:blackColor
                        ),
                      ),
                      Text(
                        "User name",
                        style: const TextStyle(color: greyColor),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.qr_code,
                  color: tabColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: tabColor.withOpacity(0.5),
          ),
          _SettingItemWidget(
              title: "Account",
              description: "Security applications, change number",
              icon: Icons.key,
              onTap: () {}),
          _SettingItemWidget(
             title: "Privacy",
              description: "Block contacts, disappearing messages",
              icon: Icons.lock,
              onTap: () {}
          ),
           _SettingItemWidget(
              title: "Chats",
              description: "Theme, wallpapers, chat history",
              icon: Icons.message,
              onTap: () {}
          ),
          _SettingItemWidget(
              title: "Logout",
              description: "Logout",
              icon: Icons.exit_to_app,
              onTap: () {}
          )
        ],
      ),
    );
  }
  
Widget _SettingItemWidget(
    {String? title, String? description, IconData? icon, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        SizedBox(
            width: 80,
            height: 80,
            child: Icon(
              icon,
              color: tabColor,
              size: 25,
            )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: const TextStyle(fontSize: 17,color: blackColor),
              ),
              const SizedBox(
                height: 3,
              ),
              Text("$description", style: const TextStyle(color: greyColor))
            ],
          ),
        )
      ],
    ),
  );
}
}

