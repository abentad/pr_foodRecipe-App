class Food {
  late int foodId;
  late String foodName;
  late String foodImage;

  Food({required this.foodId, required this.foodName, required this.foodImage});
  String foodImageGettingUrl = "https://aserar.rentoch.com/food/images/";

  Food.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    foodName = json['foodName'];
    foodImage = foodImageGettingUrl + json['foodImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['foodName'] = this.foodName;
    data['foodImage'] = this.foodImage;
    return data;
  }
}
