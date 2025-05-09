import 'package:flutter/material.dart';
import 'package:what_chat/app/constant/page_const.dart';
import 'package:what_chat/app/global/widgets/profile_widget.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:what_chat/app/theme/theme.dart';
class MyStatusPage extends StatefulWidget {
  const MyStatusPage({Key? key}) : super(key: key);

  @override
  _MyStatusPageState createState() => _MyStatusPageState();
}

class _MyStatusPageState extends State<MyStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Status Page",style: TextStyle(color: whiteColor),),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: 10, vertical: 10),
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ProfileWidget(),
                  ),
                ),

                   const SizedBox(width: 15,),
                Expanded(
                  child: Text(
                    timeago.format(DateTime.now().subtract(Duration(seconds: DateTime.now().second)),),
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    
                  ),
                ),
                 PopupMenuButton<String>(
                icon: Icon(Icons.more_vert,
                  color: whiteColor,
                size: 20,
                ),
                color: appBarColor,
                iconSize: 25,
                onSelected:(value) {},
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    value: "Delete",

                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageConst.myStatusPage,
                        );
                      },
                      child: Text("Delete"),
                    ),
                  ),
                ],
              )
              ],
            )
          ],
        ),
      ),
    );
  }
}
