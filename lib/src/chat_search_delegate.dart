import 'package:flutter/material.dart';
import 'package:bootcamp_project/src/chats/models/chat.dart';

import 'RandomGradient.dart';

class ChatSearchDelegate extends SearchDelegate<String> {
  final Function(String) updateSearchText;
  final List<Chat> chats;

  ChatSearchDelegate({required this.updateSearchText, required this.chats});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          updateSearchText(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredChats = chats.where((chat) {
      final userName = chat.userName.toLowerCase();
      final lastMessage = chat.lastMessage?.toLowerCase() ?? '';
      final queryLower = query.toLowerCase();
      return userName.contains(queryLower) || lastMessage.contains(queryLower);
    }).toList();

    return ListView.builder(
      itemCount: filteredChats.length,
      itemBuilder: (context, index) {
        final chat = filteredChats[index];

        return ListTile(
          leading: chat.userAvatar != null
              ? CircleAvatar(
                  backgroundImage: AssetImage(chat.userAvatar!),
                )
              : RandomGradient(userName: chat.userName),

          title: Text(chat.userName),
          subtitle: Text(
            chat.lastMessage ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: chat.countUnreadMessages > 0
          ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(chat.formatDateTime().toString()),
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Задайте желаемый радиус скругления
              child: Chip(
                label: Text(
                  chat.countUnreadMessages.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
          )
          : Column(children: [Text(chat.formatDateTime().toString())]),
          onTap: () {
            // Выполните действие при выборе результата поиска (если необходимо)
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // Возвращаем пустой контейнер, так как не используем саджесты
  }
}
