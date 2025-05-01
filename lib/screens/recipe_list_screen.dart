import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'ingredients_screen.dart';

class RecipeListScreen extends StatefulWidget {
  final String cuisine;
  const RecipeListScreen({super.key, required this.cuisine});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List recipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    final String data = await rootBundle.loadString('assets/data/mobile-apps-portfolio-03-recipes.json');
    final decoded = json.decode(data);
    final List allRecipes = decoded['recipes'];
    final filtered = allRecipes.where((r) => r['category'] == widget.cuisine).take(3).toList();
    setState(() {
      recipes = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.cuisine.toUpperCase()} Recipes')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(recipe['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IngredientScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}