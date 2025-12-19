import 'package:flutter/material.dart';

class InteractiveAnimationPage extends StatefulWidget {
  const InteractiveAnimationPage({super.key});

  @override
  State<InteractiveAnimationPage> createState() =>
      _InteractiveAnimationPageState();
}

class _InteractiveAnimationPageState extends State<InteractiveAnimationPage> {
  double position = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Interactive Animation")),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: position,
            left: 100,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  position = position == 100 ? 300 : 100;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    "Tap Me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
