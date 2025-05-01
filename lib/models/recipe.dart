class Recipe {
  final String name;
  final String category;
  final List<String> ingredients;

  Recipe({required this.name, required this.category, required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      category: json['category'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
}
