import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:fruitsdaily/utils/colors.dart';
import 'home_screen.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 30.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children:[
               const Text(
                    "FRUITS MARKETS",
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1,
                ),
                ),
             const SizedBox(height: 10),
             const Text(
                "Order Online",
                style: TextStyle(
                fontSize: 60,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
               ),
              ),
              const Text(
                "Market",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1,
                ),
              ),
            const SizedBox(height: 10),
             const Text("Our market always provide fresh fruits from the local vendors,let's buy from market !",
             style: TextStyle(
               color: Colors.black54,
               height: 1.4,
             ),
             ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.40,
                width: MediaQuery.of(context).size.height*0.40,
                child: Image.asset("assets/bg.png"),
              ),

          const Spacer(),
          SlideAction(
            outerColor:kPrimaryColor,
            sliderButtonIcon: const Icon(
                FontAwesomeIcons.arrowRight,
            size: 20,
              color: kPrimaryColor,
            ),
            text: "SWIPE TO START",
            textStyle:const TextStyle(fontSize:15 ,fontWeight: FontWeight.w500,color: Colors.white) ,
            onSubmit: () {
              Timer(
                const Duration(milliseconds: 500),
                    () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(product: null,),
                  ),
                ),
              );
            },
          )
            ],
          )
        ),
      ),

    );
  }
}
