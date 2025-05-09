import 'package:flutter/material.dart';
import 'package:what_chat/app/global/date/date.dart';
import 'package:what_chat/app/global/widgets/profile_widget.dart';
import 'package:what_chat/app/login_page.dart/profile_submit_page.dart';
import 'package:what_chat/app/theme/theme.dart';

class CallContactPage extends StatefulWidget {
  const CallContactPage({ Key? key }) : super(key: key);

  @override
  _CallContactPageState createState() => _CallContactPageState();
}

class _CallContactPageState extends State<CallContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Contacts"),
        
      ),
      body:   ListView.builder(
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
                  subtitle: Text("Hi there"),
                  trailing: Wrap(
                    children: [

                     Icon(Icons.call,
                    size: 19,
                    color: Colors.green,
                    ),
                    SizedBox(width: 20,),
                      Icon(Icons.video_call_outlined,
                    size: 19,
                    color: Colors.green,
                    ),
                    ]
                  )
                );
              },
            )
      
    );
  }
}