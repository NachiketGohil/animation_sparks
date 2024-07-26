import 'package:flutter/material.dart';

class AniIcon extends StatefulWidget {
  const AniIcon({super.key});

  @override
  State<AniIcon> createState() => _AniIconState();
}

class _AniIconState extends State<AniIcon> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedIcon(
          icon: AnimatedIcons.view_list,
          color: Colors.blueAccent,
          progress: animation,
          size: 100.0,
        ),
      ),
    );
  }
}
