import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

// Provider state class
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

// Main application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StateManagementPage(),
    );
  }
}

// StatefulWidget for demonstrating setState()
class StateManagementPage extends StatefulWidget {
  const StateManagementPage({super.key});

  @override
  State<StateManagementPage> createState() =>
      _StateManagementPageState();
}

class _StateManagementPageState extends State<StateManagementPage> {
  // Local state managed using setState()
  int localCount = 0;

  void incrementLocalCount() {
    setState(() {
      localCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // setState demonstration
            const Text(
              '1. Using setState()',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Local Counter: $localCount',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: incrementLocalCount,
              child: const Text('Increment Local Counter'),
            ),

            const Divider(height: 50),

            // Provider demonstration
            const Text(
              '2. Using Provider',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Consumer<CounterProvider>(
              builder: (context, counter, child) {
                return Text(
                  'Provider Counter: ${counter.count}',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().decrement();
                  },
                  child: const Text('-'),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().increment();
                  },
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
