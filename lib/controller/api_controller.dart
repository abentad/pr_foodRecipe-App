import 'dart:convert';

import 'package:aserar/model/food.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  String foodGettingUrl = "https://aserar.rentoch.com/food";
  String foodPostingUrl = "https://aserar.rentoch.com/food/upload";
  String foodImageGettingUrl = "https://aserar.rentoch.com/food/images/foodImage_1626791501631.jpeg";
  String foodRemovingUrl = "https://aserar.rentoch.com/food/remove/11";
  String foodGettingByIdUrl = "https://aserar.rentoch.com/food/byid/12";

  String stepsGettingByFoodIdUrl = "https://aserar.rentoch.com/food/steps/1";
  String stepsPostingUrl = "https://aserar.rentoch.com/food/steps/add";

  //
  List<Food> _foodsList = [];
  List<Food> get foodsList => _foodsList;

  @override
  void onInit() {
    getAllFoods();
    super.onInit();
  }

  //
  void getAllFoods() async {
    var response = await http.get(Uri.parse(foodGettingUrl));
    var decodedData = jsonDecode(response.body)['results'];
    decodedData.forEach((food) => _foodsList.add(Food.fromJson(food)));
    update();
  }
}
