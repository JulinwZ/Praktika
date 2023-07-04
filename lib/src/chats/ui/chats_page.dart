import 'package:bootcamp_project/src/RandomGradient.dart';
import 'package:bootcamp_project/src/chats/models/chat.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class ChatsPage extends StatelessWidget {
  final List<Chat> chats;

  const ChatsPage({super.key, required this.chats});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index){
        final chat = chats[index];
        if (chat.lastMessage == null){
          return const SizedBox.shrink();
        }

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
            
          },

        );
      },
    );
  }
}
