import 'package:aserar/controller/api_controller.dart';
import 'package:aserar/view/settings/settings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../detail.dart';

class HomeWidgets {
  static Widget buildHomeScreenCard(Size size, int index, ApiController controller) {
    return Padding(
      padding: index == 0 ? const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 10.0) : const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () => Get.to(() => Detail(index), transition: Transition.fadeIn, duration: Duration(milliseconds: 400)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: controller.foodsList[index].foodId,
                child: CachedNetworkImage(
                  imageUrl: controller.foodsList[index].foodImage,
                  imageBuilder: (context, imageProvider) => Container(
                    height: size.height * 0.3,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                        // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.colorBurn),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: size.height * 0.3,
                    width: size.width,
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: size.height * 0.4,
                    width: size.width,
                    child: Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.01),
                    Text(controller.foodsList[index].foodName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
                    SizedBox(height: size.height * 0.01),
                    Text('Easy, quick and yet so delicious', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      children: [
                        Icon(Icons.watch, color: Colors.grey),
                        SizedBox(width: size.width * 0.01),
                        Text('10\'', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: size.width * 0.04),
                        Text('2', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: size.width * 0.01),
                        Text('Ingredients', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      backdropColor: Colors.transparent,
      backgroundColor: Colors.white,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      elevation: 0.0,
      leadingActions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ],
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: GestureDetector(
            onTap: () => Get.to(() => Settings()),
            child: CircleAvatar(
              backgroundColor: Colors.teal[200],
              radius: 20.0,
              child: Text("AB", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
