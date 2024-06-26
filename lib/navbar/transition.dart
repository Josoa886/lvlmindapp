// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lvlmindbeta/navbar/navbar.dart';

class Transition extends StatefulWidget {
  const Transition({super.key});

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition> {
  @override
  void initState(){
    goto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration:  BoxDecoration(
                 gradient: const LinearGradient(
                   begin: Alignment.topCenter,
                   end: Alignment.bottomCenter,
                   colors: [Color(0xff2441e7), Color(0xffff1053)],
                 ),
                 image: DecorationImage(
                   image: const AssetImage('assets/images/background/fond2.jpg'),
                   fit: BoxFit.cover,
                   colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                       BlendMode.dstATop,
        ),
      ),
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
          child: SvgPicture.asset(
            'assets/images/logo/LevelMind.svg',
            width: 250,
            alignment: Alignment.bottomCenter,
          )),
            ],
        )),
      ));
  }
  Future<void> goto() async{
    await Future.delayed( const Duration(seconds: 2));
       Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const BottomNavBar()),);
  }
}