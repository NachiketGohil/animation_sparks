import 'package:flutter/material.dart';

class SoundBars extends StatefulWidget {
  const SoundBars({super.key});

  @override
  State<SoundBars> createState() => _SoundBarsState();
}

class _SoundBarsState extends State<SoundBars> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  List<double> _size = [10.0, 20.0, 30.0, 40.0, 30.0, 20.0, 10.0];
  bool isPlaying = false;

  void _updateSize() {
    print("Updating Size");
    setState(() {
      _size = isPlaying
          ? [50.0, 60.0, 70.0, 20.0, 10.0, 80.0, 60.0]
          : [10.0, 20.0, 30.0, 40.0, 30.0, 20.0, 10.0];
      // isPlaying = !isPlaying;
    });
  }

  void clickToPlay() {
    isPlaying = true;
    print("COntroller");
    controller.forward();
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    print("Playing");
    print("isPlaying : $isPlaying");
  }

  void finishToPause() {
    print("COntrolled");
    if (isPlaying) {
      controller.reverse();
      animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
      print("Pausing");
      isPlaying = false;
      print("isPlaying : $isPlaying");
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    print("isPlaying : $isPlaying");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          color: Colors.blueAccent,
          progress: animation,
          size: 40.0,
        ),
        onPressed: () {
          print("Button CLicked");
          print("isPlaying : $isPlaying");
          isPlaying ? finishToPause() : clickToPlay();
          _updateSize();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: ListView.builder(
          itemCount: _size.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: AnimatedSize(
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                child: Container(
                  height: 10,
                  width: _size[index],
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
