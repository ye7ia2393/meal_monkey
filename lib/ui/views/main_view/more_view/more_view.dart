import 'package:flutter/material.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "More View",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
