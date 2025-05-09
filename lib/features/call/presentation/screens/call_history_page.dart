import 'package:flutter/material.dart';
import 'package:what_chat/app/global/date/date.dart';
import 'package:what_chat/app/global/widgets/profile_widget.dart';
import 'package:what_chat/app/theme/theme.dart';

class CallHistoryPage extends StatelessWidget {
  const CallHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: Text(
                "Recent",
                style: TextStyle(color: greyColor, fontWeight: FontWeight.w500),
              ),
            ),
            ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: ScrollPhysics(),
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
                  title: Text("User name",
                  style: TextStyle(color: blackColor),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.call_made_rounded,
                        color: Colors.green,
                        size: 15,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        formatDateTime(
                          DateTime.now(),
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.call,
                  size: 19,
                  color: Colors.green,
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
