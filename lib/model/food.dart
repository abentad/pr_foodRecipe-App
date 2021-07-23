class Food {
  String foodImageGettingUrl = "https://aserar.rentoch.com/food/images/";

  late int foodId;
  late String foodName;
  late String foodNameAm;
  late String foodDescription;
  late String foodDescriptionAm;
  late String foodImage;

  Food({required this.foodId, required this.foodName, required this.foodNameAm, required this.foodDescription, required this.foodDescriptionAm, required this.foodImage});

  Food.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    foodName = json['foodName'];
    foodNameAm = json['foodNameAm'];
    foodDescription = json['foodDescription'];
    foodDescriptionAm = json['foodDescriptionAm'];
    foodImage = foodImageGettingUrl + json['foodImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['foodName'] = this.foodName;
    data['foodNameAm'] = this.foodNameAm;
    data['foodDescription'] = this.foodDescription;
    data['foodDescriptionAm'] = this.foodDescriptionAm;
    data['foodImage'] = this.foodImage;
    return data;
  }
}
