import 'package:flutter/material.dart';
import 'package:what_chat/app/constant/page_const.dart';
import 'package:what_chat/app/global/date/date.dart';
import 'package:what_chat/app/global/widgets/profile_widget.dart';
import 'package:what_chat/app/theme/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, PageConst.singleChatPage);
        },
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
         return    ListTile(
              leading: SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ProfileWidget(),
                ),
              ),
              title: Text("User name",
              style: TextStyle(
                color: blackColor,
              ),
              ),
              subtitle: Text(
                "last message nguyen van tam nguyen van tam nguyen nguyen nguyen",
                
               maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
              formatDateTime(DateTime.now())
              ),
            );
          },
        ),
      ),
    );
  }
}
