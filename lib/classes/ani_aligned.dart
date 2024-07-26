import 'package:flutter/material.dart';

class AniAligned extends StatefulWidget {
  const AniAligned({super.key});

  @override
  State<AniAligned> createState() => _AniAlignedState();
}

class _AniAlignedState extends State<AniAligned> {
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
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 100.0,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.purpleAccent[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedAlign(
              alignment: selected ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Container(
                height: 60,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
