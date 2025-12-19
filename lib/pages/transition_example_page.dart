import 'package:flutter/material.dart';

class TransitionExamplePage extends StatelessWidget {
  const TransitionExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Transition")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Next Page"),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, animation, __) => const NextPage(),
                transitionsBuilder: (_, animation, __, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Next Page")),
      body: const Center(
        child: Text(
          "Slide Transition Success!",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
