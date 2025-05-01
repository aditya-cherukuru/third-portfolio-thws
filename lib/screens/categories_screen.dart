import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';

class CuisineScreen extends StatelessWidget {
  const CuisineScreen({super.key});

  final List<String> cuisines = const ['italian', 'indian', 'turkish'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe App by Aditya Cherukuru'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 24),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeListScreen(
                      cuisine: cuisines[index],
                    ),
                  ),
                );
              },
              child: Text(
                cuisines[index].toUpperCase(),
                style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
              ),
            ),
          );
        },
      ),
    );
  }
}