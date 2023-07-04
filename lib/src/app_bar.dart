import 'package:flutter/material.dart';
import 'package:bootcamp_project/src/chats/models/chat.dart';

import 'chat_search_delegate.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Chat> chats;
  const MyAppBar({super.key, required this.chats});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  _MyAppBarState createState() => _MyAppBarState(chats: chats);
}
  

class _MyAppBarState extends State<MyAppBar> {
  String searchText = '';
  late List<Chat> chats;

  _MyAppBarState({required this.chats});

  @override
  void initState() {
    super.initState();
    chats = widget.chats;
  }
  

  void updateSearchText(String text) {
    setState(() {
      searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My AppBar'),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      actions: [
        IconButton(
        onPressed: () {
          showSearch(
            context: context,
            delegate: ChatSearchDelegate(
              updateSearchText: updateSearchText,
              chats: chats, // Добавлено передача списка чатов
            ),
          );
        },
        icon: Icon(Icons.search),
      ),

      ],
    );
  }
}


// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  // @override
  // Size get preferredSize => Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text('My Appbar'),
//       leading: IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.menu),
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.search),
//         ),
//       ],
//     );
//   }
// }
