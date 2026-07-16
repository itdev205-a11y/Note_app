import 'dart:async';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {


  late AnimationController _controller;

  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;


  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );


    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);


    scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );


    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );


    _controller.forward();



    Timer(
      const Duration(seconds: 4),
          (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      },
    );

  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            FadeTransition(
              opacity: fadeAnimation,

              child: ScaleTransition(

                scale: scaleAnimation,

                child: Container(

                  width: 120,
                  height: 120,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(30),

                  ),

                  child: const Icon(

                    Icons.note_alt,

                    size: 70,

                    color: Colors.black,

                  ),

                ),

              ),

            ),



            const SizedBox(height: 30),



            SlideTransition(

              position: slideAnimation,

              child: FadeTransition(

                opacity: fadeAnimation,

                child: const Text(

                  "My Notes",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 35,

                    fontWeight: FontWeight.bold,

                  ),

                ),

              ),

            ),



            const SizedBox(height: 10),



            const Text(

              "Write your ideas",

              style: TextStyle(

                color: Colors.grey,

                fontSize: 16,

              ),

            ),


          ],

        ),

      ),

    );

  }

}