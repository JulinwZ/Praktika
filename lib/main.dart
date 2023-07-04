import 'dart:convert';

import 'package:bootcamp_project/src/app.dart';
import 'package:bootcamp_project/src/chats/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final chats = await _loadChatList();
  
  initializeDateFormatting('ru_RU', null).then((_) {
    runApp(App(chats: chats));
  });
}

Future<List<Chat>> _loadChatList() async {
  final result = <Chat>[];
  final rawData =
      jsonDecode(await rootBundle.loadString('assets/data/bootcamp.json'));
  for (final item in rawData['data']) {
    result.add(Chat.fromJson(item));
  }
  return result;
}
