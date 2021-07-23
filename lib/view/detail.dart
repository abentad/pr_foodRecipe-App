import 'package:aserar/controller/api_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: _apiController.foodsList[selectedFood].foodId,
              child: CachedNetworkImage(
                imageUrl: _apiController.foodsList[selectedFood].foodImage,
                imageBuilder: (context, imageProvider) => Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                    color: Colors.grey[200],
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                      // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.colorBurn),
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  height: size.height * 0.4,
                  width: size.width,
                ),
                errorWidget: (context, url, error) => Container(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(_apiController.foodsList[selectedFood].foodNameAm, style: TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(_apiController.foodsList[selectedFood].foodDescriptionAm, style: TextStyle(color: Colors.black, fontSize: 22.0)),
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Ingredients", style: TextStyle(color: Colors.grey, fontSize: 22.0, fontWeight: FontWeight.bold)),
            ),
            GetBuilder<ApiController>(
              builder: (controller) => Expanded(
                child: ListView.builder(
                  itemCount: controller.ingredientList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("->  " + controller.ingredientList[index].ingredientNameAm, style: TextStyle(color: Colors.black, fontSize: 18.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MaterialButton(
                onPressed: () {},
                height: 60.0,
                minWidth: double.infinity,
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Start Cooking', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600)),
                    SizedBox(width: size.width * 0.05),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
