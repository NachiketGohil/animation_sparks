import 'package:flutter/material.dart';

class AniContainer extends StatefulWidget {
  const AniContainer({super.key});

  @override
  State<AniContainer> createState() => _AniContainerState();
}

class _AniContainerState extends State<AniContainer> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 200.0 : 100.0,
            height: selected ? 100.0 : 200.0,
            decoration: BoxDecoration(
              color: selected ? Colors.red : Colors.green,
              borderRadius: BorderRadius.circular(selected ? 30 : 2),
            ),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
