import 'package:flutter/material.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setup"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Set Up Your Profile",
                style: Theme.of(context).textTheme.headlineLarge, // Updated to headlineLarge
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add functionality here
                },
                child: Text("Start Setup"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
