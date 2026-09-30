import 'package:flutter/material.dart';

void main() {
  runApp(const ThemeDemoApp());
}

class ThemeDemoApp extends StatelessWidget {
  const ThemeDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Themes and Custom Styles',

      // Global application theme
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),

        // Global text styles
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
          ),
        ),

        // Global ElevatedButton style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 14,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      home: const ThemeHomePage(),
    );
  }
}

class ThemeHomePage extends StatelessWidget {
  const ThemeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Themes & Custom Styles'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Uses global headline style
            Text(
              'Welcome to Flutter',
              style: theme.textTheme.headlineSmall,
            ),

            const SizedBox(height: 15),

            // Uses global body style
            Text(
              'This text uses the application theme.',
              style: theme.textTheme.bodyLarge,
            ),

            const SizedBox(height: 25),

            // Custom styled container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Text(
                'Custom Styled Container',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Card with custom styling
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.palette,
                      size: 40,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Custom Card Style',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Uses globally defined button theme
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Styled button pressed!'),
                    ),
                  );
                },
                child: const Text('Styled Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
