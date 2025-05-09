import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:what_chat/app/constant/page_const.dart';
import 'package:what_chat/app/global/date/date.dart';
import 'package:what_chat/app/global/widgets/profile_widget.dart';
import 'package:what_chat/app/theme/theme.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
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
                    Positioned(
                      right: 4,
                      bottom: 4,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: tabColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 2, color: backgroundColor),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Tap to add your status",
                      style: TextStyle(color: blackColor),
                    ),
                  ],
                )),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, PageConst.myStatusPage);
                  },
                  child: Icon(
                    
                    Icons.more_horiz,
                    size: 25,
                    color: blackColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Recent updates",
                style: TextStyle(
                  fontSize: 15,
                  color: blackColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: ProfileWidget(),
                      ),
                    ),
                    title: Text("User name",style: TextStyle(color: blackColor),),
                    subtitle: Text(
                      formatDateTime(
                        DateTime.now(),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
