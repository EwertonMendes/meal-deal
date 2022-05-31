class Meal {
  final String id;
  final String name;
  final String nationality;
  final String? instructions;
  final String picture;

  Meal({required this.id, required this.name, required this.nationality, this.instructions, required this.picture});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      nationality: json['strArea'],
      picture: json['strMealThumb']
    );
  }
}