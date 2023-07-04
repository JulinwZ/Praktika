import 'package:bootcamp_project/src/chats/models/chat.dart';
import 'package:bootcamp_project/src/chats/ui/chats_page.dart';
import 'package:flutter/material.dart';

import 'package:bootcamp_project/src/app_bar.dart';

class App extends StatelessWidget {
  final List<Chat> chats;

  const App({Key? key, required this.chats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: MyAppBar(chats: chats),
        body: ChatsPage(
          chats: chats,
        ),
      ),
    );
  }
}


// class App extends StatelessWidget {
//   final List<Chat> chats;

//   const App({super.key, required this.chats});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.indigo),
//       home: Scaffold(
//         appBar: MyAppBar(),
//         body: ChatsPage(
//           chats: chats,
//         ),
//       ),
//     );
//   }
// }
