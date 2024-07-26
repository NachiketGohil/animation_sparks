import 'package:flutter/material.dart';

class AniSwitcher extends StatefulWidget {
  const AniSwitcher({super.key});

  @override
  State<AniSwitcher> createState() => _AniSwitcherState();
}

class _AniSwitcherState extends State<AniSwitcher> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Text(
                '$_count',
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.plus_one),
                color: Colors.purpleAccent,
                onPressed: () {
                  setState(() {
                    _count += 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.exposure_minus_1),
                color: Colors.purpleAccent,
                onPressed: () {
                  setState(() {
                    _count -= 1;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
