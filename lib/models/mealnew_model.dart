class NewMeal {
  String idMeal;
  String strMeal;
  String? strDrinkAlternate;
  String strCategory;
  String strArea;

  NewMeal({
    required this.idMeal,
    required this.strMeal,
    this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
  });

  factory NewMeal.fromJson(Map<String, dynamic> json) {
    return NewMeal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
    );
  }
}