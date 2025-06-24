import 'package:flutter/material.dart';
import 'package:what_chat/app/constant/page_const.dart';
import 'package:what_chat/app/theme/theme.dart';
import 'package:what_chat/features/call/presentation/screens/call_contact_page.dart';
import 'package:what_chat/features/call/presentation/screens/call_history_page.dart';
import 'package:what_chat/features/chat/presentation/screens/chat_page.dart';
import 'package:what_chat/features/status/presentation/screens/status_page.dart';
import 'package:what_chat/home/contact_page.dart';
import 'package:what_chat/app/setting/setting_page.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({Key? key, required this.uid, }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentTabIndex = 0;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ChatPage();
        _currentTabIndex = 0;
      case 1:
        page = StatusPage();
        _currentTabIndex = 1;
      case 2:
        page = CallHistoryPage();
        _currentTabIndex = 2;

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          "What Chat",
          style: TextStyle(
            fontSize: 20,
            color: whiteColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          Row(
            children: [
              Icon(
                Icons.camera_alt_rounded,
                color: whiteColor,
                size: 20,
              ),
              SizedBox(
                width: 25,
              ),
              Icon(
                Icons.search_rounded,
                color: whiteColor,
                size: 20,
              ),
              SizedBox(
                width: 25,
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: whiteColor,
                  size: 20,
                ),
                color: tabColor,
                iconSize: 25,
                onSelected: (value) {
                  Navigator.pushNamed(context, PageConst.settingsPage);
                },
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    value: "Setting",
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageConst.settingsPage,
                        );
                      },
                      child: Text("Setting"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton:
          switchFloatingActionButtonOnTabIndex(_currentTabIndex),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_end),
            label: 'Calls',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: tabColor,
        unselectedItemColor: greyColor,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }

  switchFloatingActionButtonOnTabIndex(int index) {
    switch (index) {
      case 0:
        {
          return FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(
                context,

                PageConst.contactUsersPage, //arguments: widget.uid
              );
            },
            backgroundColor: tabColor,
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
          );
        }

      case 1:
        {
          return FloatingActionButton(
            onPressed: () {},
            backgroundColor: tabColor,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          );
        }
      case 2:
        {
          return FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, PageConst.callContactsPage);
            },
            backgroundColor: tabColor,
            child: Icon(
              Icons.add_call,
              color: Colors.white,
            ),
          );
        }

      default:
        {
          return FloatingActionButton(
            onPressed: () {},
            backgroundColor: tabColor,
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
          );
        }
    }
  }
}
