import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class Chat {
  final String userName;
  final String? lastMessage;
  final DateTime? date;
  final String? userAvatar;
  final int countUnreadMessages;

  const Chat({
    required this.userName,
    this.lastMessage,
    this.date,
    this.userAvatar,
    this.countUnreadMessages = 0,
  });

  factory Chat.fromJson(Map<String, dynamic> map) {
    return Chat(
      userName: map['userName'] ?? '',
      lastMessage: map['lastMessage'],
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      userAvatar: map['userAvatar'] != null
          ? 'assets/avatars/${map['userAvatar']}'
          : null,
      countUnreadMessages: map['countUnreadMessages']?.toInt() ?? 0,
    );
  }
  String formatDateTime() {
    if (date == null) {
      return '';
    }

    DateTime now = DateTime.now();
    DateTime startOfWeek = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

    DateFormat formatter;
    if (date!.isAfter(startOfWeek) && date!.isBefore(endOfWeek)) {
      formatter = DateFormat('EEEE', 'ru_RU'); // Выводим день недели
    } else {
      formatter = DateFormat('d MMM', 'ru_RU'); // Выводим день и месяц
    }

    String formattedDateTime = formatter.format(date!);
    return formattedDateTime;
  }

  
}
