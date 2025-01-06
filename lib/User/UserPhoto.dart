import 'package:flutter/material.dart';

class Userphoto extends StatefulWidget {
  const Userphoto({super.key});

  @override
  State<Userphoto> createState() => _UserphotoState();
}

class _UserphotoState extends State<Userphoto> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(child: Icon(Icons.account_circle, size: 70,), radius: 50);
  }
}
