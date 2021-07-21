import 'package:aserar/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  final int selectedFood;
  Detail(this.selectedFood);

  final ApiController _apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Hero(
              tag: _apiController.foodsList[selectedFood].foodId,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                child: Container(
                  height: size.height * 0.372,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(_apiController.foodsList[selectedFood].foodImage), fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
