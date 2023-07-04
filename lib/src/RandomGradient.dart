import 'package:flutter/material.dart';
import 'dart:math';

class RandomGradient extends StatelessWidget{
  final String userName;

  const RandomGradient({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final Color startColor = Color.fromARGB(255, random.nextInt(256), random.nextInt(256),random.nextInt(256));
    const Color endColor = Color.fromARGB(255, 255, 243, 243);
    return ClipOval(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            userName.substring(0,1).toUpperCase(),
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}