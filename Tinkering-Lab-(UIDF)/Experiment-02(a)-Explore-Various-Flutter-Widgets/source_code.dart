import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Widgets'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Text widget
                const Text(
                  'Exploring Flutter Widgets',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // Image widget
                Image.network(
                  'https://picsum.photos/300/150',
                  height: 150,
                  width: 300,
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 20),

                // Container widget
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue.shade100,
                  ),
                  child: const Text(
                    'This is a Container widget.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                const SizedBox(height: 20),

                // Row widget with Icon widgets
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home, size: 40),
                    Icon(Icons.favorite, size: 40),
                    Icon(Icons.settings, size: 40),
                  ],
                ),

                const SizedBox(height: 20),

                // ElevatedButton widget
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed');
                  },
                  child: const Text('Click Me'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
