import 'package:flutter/material.dart';

void main() {
  runApp(const DebuggingApp());
}

class DebuggingApp extends StatelessWidget {
  const DebuggingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Debugging',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DebuggingPage(),
    );
  }
}

class DebuggingPage extends StatefulWidget {
  const DebuggingPage({super.key});

  @override
  State<DebuggingPage> createState() => _DebuggingPageState();
}

class _DebuggingPageState extends State<DebuggingPage> {
  int counter = 0;

  void incrementCounter() {
    // Debug message displayed in the console.
    debugPrint('Before increment: $counter');

    setState(() {
      counter++;
    });

    debugPrint('After increment: $counter');
  }

  void resetCounter() {
    debugPrint('Resetting counter');

    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Debug information about screen width.
    debugPrint(
      'Screen width: ${MediaQuery.sizeOf(context).width}',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Debugging'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Debugging Example',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Text(
                'Counter: $counter',
                style: const TextStyle(fontSize: 30),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: incrementCounter,
                child: const Text('Increment'),
              ),

              const SizedBox(height: 10),

              OutlinedButton(
                onPressed: resetCounter,
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
