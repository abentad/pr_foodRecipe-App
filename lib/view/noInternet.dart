import 'package:aserar/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternet extends StatelessWidget {
  final ApiController _apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Oops\nNo Internet", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600)),
              SizedBox(height: size.height * 0.02),
              MaterialButton(
                onPressed: () => _apiController.retry(),
                child: Text("Retry", style: TextStyle(color: Colors.white, fontSize: 18.0)),
                color: Colors.teal,
                height: 40.0,
                minWidth: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
