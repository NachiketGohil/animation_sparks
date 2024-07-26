import 'package:animation_sparks/classes/ani_aligned.dart';
import 'package:animation_sparks/classes/ani_container.dart';
import 'package:animation_sparks/classes/ani_padding.dart';
import 'package:animation_sparks/classes/ani_switcher.dart';
import 'package:animation_sparks/classes/sound_bars.dart';
import 'package:flutter/material.dart';

import 'classes/ani_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Sparks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimationsList(),
    );
  }
}

class AnimationsList extends StatelessWidget {
  const AnimationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Demo"),
      ),
      body: ListView(
        children: [
          items(
            name: "Animated Align",
            navigate: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AniAligned()),
              );
            },
          ),
          items(
            name: "Animated Container",
            navigate: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AniContainer()),
            ),
          ),
          items(
            name: "Animated Icon",
            navigate: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AniIcon()),
            ),
          ),
          items(
            name: "Animated Padding",
            navigate: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AniPadding()),
            ),
          ),
          items(
            name: "Animated Switcher",
            navigate: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AniSwitcher()),
            ),
          ),
          Divider(),
          items(
            name: "Sound Bars",
            navigate: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SoundBars()),
            ),
          ),
        ],
      ),
    );
  }

  Widget items({
    required String name,
    required VoidCallback navigate,
  }) {
    return ListTile(
      title: Text(name),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: navigate,
    );
  }
}
