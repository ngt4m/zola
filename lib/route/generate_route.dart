import 'package:flutter/material.dart';
import 'package:what_chat/app/constant/page_const.dart';
import 'package:what_chat/features/call/presentation/screens/call_contact_page.dart';
import 'package:what_chat/features/chat/presentation/screens/single_chat_page.dart';
import 'package:what_chat/features/status/presentation/screens/my_status_page.dart';
import 'package:what_chat/home/contact_page.dart';
import 'package:what_chat/home/home_page.dart';
import 'package:what_chat/setting/setting_page.dart';

class GenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    switch (name) {
      case PageConst.homePage:{
        return MaterialBuilder(HomePage());
      }
      case PageConst.contactUsersPage:
        {
          return MaterialBuilder(ContactPage());
        }
      case PageConst.settingsPage:
        {
          return MaterialBuilder(SettingPage());
        }
        case PageConst.myStatusPage:{
          return MaterialBuilder(MyStatusPage());
        }
        case PageConst.callContactsPage:
        {
          return MaterialBuilder(CallContactPage());
        }
         case PageConst.singleChatPage:
        {
          return MaterialBuilder(SingleChatPage());
        }
    }
  }
}

dynamic MaterialBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
