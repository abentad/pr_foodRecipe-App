import 'dart:convert';

import 'package:aserar/model/food.dart';
import 'package:aserar/model/ingredient.dart';
import 'package:aserar/view/home/homes.dart';
import 'package:aserar/view/noInternet.dart';
import 'package:connectivity/connectivity.dart';
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

  String ingredientGettingByIdUrl = "https://aserar.rentoch.com/food/ingredients/";
  //
  List<Food> _foodsList = [];
  List<Ingredient> _ingredientsList = [];

  List<Food> get foodsList => _foodsList;
  List<Ingredient> get ingredientList => _ingredientsList;

  @override
  void onInit() {
    getAllFoods();
    super.onInit();
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("I am connected to a mobile network.");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("I am connected to a wifi network.");
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      //not connected to internet
      Get.offAll(() => NoInternet(), transition: Transition.fadeIn);
      return false;
    } else {
      return false;
    }
  }

  //
  void getAllFoods() async {
    bool hasInternet = await checkConnection();
    if (hasInternet) {
      var response = await http.get(Uri.parse(foodGettingUrl));
      var decodedData = jsonDecode(response.body)['results'];
      decodedData.forEach((food) => _foodsList.add(Food.fromJson(food)));
      print("Found list of foods");
      update();
    } else {}
  }

  void retry() async {
    bool hasInternet = await checkConnection();
    if (hasInternet) {
      Get.offAll(() => Homes(), transition: Transition.fadeIn);
      var response = await http.get(Uri.parse(foodGettingUrl));
      var decodedData = jsonDecode(response.body)['results'];
      decodedData.forEach((food) => _foodsList.add(Food.fromJson(food)));
      print("Found list of foods");
      update();
    } else {}
  }

  void getFoodIngredients({required String foodId}) async {
    bool hasInternet = await checkConnection();
    if (hasInternet) {
      var response = await http.get(Uri.parse(ingredientGettingByIdUrl + foodId));
      var decodedData = jsonDecode(response.body)['results'];
      _ingredientsList.clear();
      decodedData.forEach((ingredient) => _ingredientsList.add(Ingredient.fromJson(ingredient)));
      print("got ${_ingredientsList.length} ingredients");
      update();
    } else {}
  }
}
