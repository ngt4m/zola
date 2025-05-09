import 'package:flutter/material.dart';
import 'package:what_chat/app/global/widgets/profile_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({ Key? key }) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}
class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select contact"),),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
        return ListTile(
          leading:  SizedBox(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: ProfileWidget(),
              ),
            ),
            title: Text("User name"),
          subtitle: Text("Nguyen van tam",
           maxLines: 1,
              overflow: TextOverflow.ellipsis,),
        );
      }),
    );
  }
}