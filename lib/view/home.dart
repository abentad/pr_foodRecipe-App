import 'package:aserar/constants.dart';
import 'package:aserar/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width,
              padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                color: Constants.colors['homeScreen']['topsearchbarColor'],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.teal),
                        hintText: "Type in what you are looking for...",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 24.0,
                    backgroundColor: Colors.teal,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),

            //
            GetBuilder<ApiController>(
              builder: (controller) => Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.foodsList.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.3,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(image: NetworkImage(controller.foodsList[index].foodImage), fit: BoxFit.fill),
                          ),
                          child: Column(
                            children: [],
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
