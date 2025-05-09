import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:what_chat/app/theme/theme.dart';
import 'package:swipe_to/swipe_to.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({Key? key}) : super(key: key);

  @override
  _SingleChatPageState createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final TextEditingController _messageController = TextEditingController();
  bool _isDisplaySendButton = false;
  bool _isShowAttachWindow = false;
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User name",
              style: TextStyle(color: blackColor),
            ),
            Text(
              "online",
              style: TextStyle(
                  color: lightGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.videocam_rounded,
              size: 25,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.call,
            size: 22,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.more_vert,
            size: 22,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: GestureDetector(
      onTap: (){
        setState(() {
          _isShowAttachWindow=false;
        });
      },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: lightGreyColor,
              ),
            ),
            Column(
              children: [
                Expanded(
                    child: ListView(children: [
                  _MessageLayout(
                      message: "Hello",
                      alignment: Alignment.centerRight,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: true,
                      messageBgColor: messageColor,
                      onSwipe: () {}),
                  _MessageLayout(
                      message:
                          "Hidhdhdhkdjgkdg dghduighiuhg dhgdhg hdihgd dgdh gdgj",
                      alignment: Alignment.centerLeft,
                      createAt: Timestamp.now(),
                      isSeen: true,
                      isShowTick: true,
                      messageBgColor: senderMessageColor,
                      onSwipe: () {}),
                ])),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: tabColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            onTap: (){
                              setState(() {
                                _isShowAttachWindow= false;
                              });
                            },
                            controller: _messageController,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  _isDisplaySendButton = true;
                                });
                              } else {
                                setState(() {
                                  _isDisplaySendButton = false;
                                });
                              }
                            },
                            style: TextStyle(
                              color: blackColor,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              prefixIcon: Icon(
                                Icons.emoji_emotions,
                                color: whiteColor,
                              ),
        
        
        
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 9),
                                child: Wrap(
                                  children: [
        
                                    GestureDetector(
                                      onTap: (){
                                       setState(() {
                                         _isShowAttachWindow= true;
                                       });
                                      },
                                      child: Icon(
                                        Icons.attach_file,
                                        color: whiteColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.camera_alt,
                                      color: whiteColor,
                                    )
                                  ],
                                ),
                              ),
                              hintText: 'Message',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: tabColor,
                        ),
                        child: Center(
                          child: Icon(
                            _isDisplaySendButton ? Icons.send : Icons.mic,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 _isShowAttachWindow == true?
                Positioned(
                   bottom: 65,
                    top: 20,
                    left: 15,
                    right: 15,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.2,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                      decoration: BoxDecoration(
                          color: bottomAttachContainerColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _AttachWindowItem(
                                icon: Icons.document_scanner,
                                color: Colors.deepPurpleAccent,
                                title: "Document",
                              ),
                              _AttachWindowItem(
                                  icon: Icons.camera_alt,
                                  color: Colors.pinkAccent,
                                  title: "Camera",
                                  onTap: () {}),
                              _AttachWindowItem(
                                  icon: Icons.image,
                                  color: Colors.purpleAccent,
                                  title: "Gallery"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _AttachWindowItem(
                                  icon: Icons.headphones,
                                  color: Colors.deepOrange,
                                  title: "Audio"),
                              _AttachWindowItem(
                                  icon: Icons.location_on,
                                  color: Colors.green,
                                  title: "Location"),
                              _AttachWindowItem(
                                  icon: Icons.account_circle,
                                  color: Colors.deepPurpleAccent,
                                  title: "Contact"),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _AttachWindowItem(
                                  icon: Icons.bar_chart,
                                  color: tabColor,
                                  title: "Poll",
                                ),
                                _AttachWindowItem(
                                    icon: Icons.gif_box_outlined,
                                    color: Colors.indigoAccent,
                                    title: "Gif",
                                    onTap: () {}),
                                _AttachWindowItem(
                                    icon: Icons.videocam_rounded,
                                    color: Colors.lightGreen,
                                    title: "Video",
                                    onTap: () {}),
                              ])
                        ],
                      ),
                    ),
                    )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _MessageLayout(
      {Color? messageBgColor,
      Alignment? alignment,
      Timestamp? createAt,
      VoidCallback? onSwipe,
      String? message,
      String? messageType,
      bool? isShowTick,
      bool? isSeen,
      VoidCallback? onLongPress,
      double? rightPadding}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SwipeTo(
        //  onRightSwipe: onSwipe,
        child: GestureDetector(
          onLongPress: onLongPress,
          child: Container(
            alignment: alignment,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          left: 5, right: 70, top: 5, bottom: 5),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: messageBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "$message",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Row(
                    children: [
                      Text(
                        DateFormat.jm().format(
                          createAt!.toDate(),
                        ),
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      isShowTick == true
                          ? Icon(
                              isSeen == true ? Icons.done_all : Icons.done,
                              size: 16,
                              color: isSeen == true ? Colors.blue : Colors.grey,
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_AttachWindowItem(
    {IconData? icon, Color? color, String? title, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          width: 55,
          height: 55,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: color),
          child: Icon(icon),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "$title",
          style: const TextStyle(color: greyColor, fontSize: 13),
        ),
      ],
    ),
  );
}
