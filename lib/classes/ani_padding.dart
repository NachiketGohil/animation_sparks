import 'package:flutter/material.dart';

class AniPadding extends StatefulWidget {
  const AniPadding({super.key});

  @override
  State<AniPadding> createState() => _AniPaddingState();
}

class _AniPaddingState extends State<AniPadding> {
  double padValue = 0.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ColoredBox(
            color: Colors.blueGrey,
            child: AnimatedPadding(
              padding: EdgeInsets.symmetric(
                vertical: padValue,
                horizontal: padValue,
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: () {
                  _updatePadding(padValue == 0.0 ? 40.0 : 0.0);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
