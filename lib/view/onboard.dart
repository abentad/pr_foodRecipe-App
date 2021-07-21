import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffFD7463),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enjoy \nCooking", style: GoogleFonts.notoSerif(fontSize: 40.0, color: Colors.white)),
              SizedBox(height: size.height * 0.04),
              Text("Delicious and detailed restaurant recipes on your phone.", style: GoogleFonts.montserrat(fontSize: 18.0, color: Colors.white)),
              SizedBox(height: size.height * 0.04),
              SvgPicture.asset("assets/onb.svg", height: size.height * 0.5, width: size.width * 0.5),
              Spacer(),
              MaterialButton(
                onPressed: () {},
                height: 50.0,
                minWidth: double.infinity,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                child: Text("Get started", style: TextStyle(color: Colors.brown, fontSize: 20.0, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
