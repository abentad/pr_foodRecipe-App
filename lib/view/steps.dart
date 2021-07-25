import 'package:aserar/controller/api_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Steps extends StatelessWidget {
  final selectedFood;
  Steps(this.selectedFood);

  final ApiController _apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.04),
              CachedNetworkImage(
                imageUrl: _apiController.foodsList[selectedFood].foodImage,
                imageBuilder: (context, imageProvider) => Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      // fit: BoxFit.fill,
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
              SizedBox(height: size.height * 0.02),
              Text(_apiController.foodsList[selectedFood].foodName, style: TextStyle(fontSize: 20.0)),
              SizedBox(height: size.height * 0.1),
              GetBuilder<ApiController>(
                builder: (controller) => Expanded(
                  child: ListView.builder(
                    itemCount: controller.stepsList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(controller.stepsList[index].stepDescription.capitalize.toString(), style: TextStyle(color: Colors.black, fontSize: 18.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal,
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(2, 7), blurRadius: 20.0)],
                ),
                child: Center(child: Icon(Icons.arrow_forward, color: Colors.white)),
              ),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
