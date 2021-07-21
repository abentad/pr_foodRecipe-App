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
        child: Column(
          children: [
            Hero(
              tag: _apiController.foodsList[selectedFood].foodId,
              child: CachedNetworkImage(
                imageUrl: _apiController.foodsList[selectedFood].foodImage,
                imageBuilder: (context, imageProvider) => Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
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
          ],
        ),
      ),
    );
  }
}
