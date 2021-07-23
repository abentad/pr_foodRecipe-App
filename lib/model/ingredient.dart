class Ingredient {
  late int ingredientId;
  late String ingredientName;
  late String ingredientNameAm;
  late int foodId;

  Ingredient({required this.ingredientId, required this.ingredientName, required this.ingredientNameAm, required this.foodId});

  Ingredient.fromJson(Map<String, dynamic> json) {
    ingredientId = json['ingredientId'];
    ingredientName = json['ingredientName'];
    ingredientNameAm = json['ingredientNameAm'];
    foodId = json['foodId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingredientId'] = this.ingredientId;
    data['ingredientName'] = this.ingredientName;
    data['ingredientNameAm'] = this.ingredientNameAm;
    data['foodId'] = this.foodId;
    return data;
  }
}
