// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:lvlmindbeta/animations/simpleDelayedAnimation.dart';
import 'package:lvlmindbeta/screens/loginpage.dart';
import 'package:lvlmindbeta/screens/redirecting.dart';
import 'package:lvlmindbeta/screens/welcomepage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  // Constructor added
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appbar(context),
      // Conteneur pour les élements de la page
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: background(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
            ),
            DelayedAnimation(
              delay: 900,
              child: lvlminlogo(),
            ),
            DelayedAnimation(
              delay: 1000,
              child: SizedBox(
                height: 60,
              ),
            ),
            DelayedAnimation(
              delay: 1000,
              child: textsection(),
            ),
            DelayedAnimation(
              delay: 1000,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    loginbutton(context),
                    const SizedBox(height: 15),
                    // Texte avec lien de redirection dans une page redirecting
                    SizedBox(
                      child: registersection(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Barre d'application
  AppBar appbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomePage(),
              ));
        },
      ),
    );
  }

  // Pour le fond
  BoxDecoration background() {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff2441e7), Color(0xffff1053)],
      ),
      image: DecorationImage(
        image: const AssetImage('assets/images/background/fond1.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.5),
          BlendMode.dstATop,
        ),
      ),
    );
  }

  // Notre logo
  SizedBox lvlminlogo() {
    return SizedBox(
      height: 140,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          'assets/images/logo/lvlind10.jpg',
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Text("Image loading problem");
          },
        ),
      ), //Logo de notre application
    );
  }

  // Texte d'introduction
  Container textsection() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: const [
          Text(
            "Your adventure begins here and now.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Train your mind to gain more knowledge with levelmind",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }

  // go to the login page
  ElevatedButton loginbutton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        padding: const EdgeInsets.all(13),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientText(
            'Connect with Personal ID',
            style: TextStyle(
              fontFamily: 'Josefin',
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            gradientType: GradientType.linear,
            colors: const [Color(0xff2441e7), Color(0xffff1053)],
          ),
        ],
      ),
    );
  }

  // Register
  Row registersection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize
          .min, // Pour diminuer l'espacement entre les deux élements
      children: [
        Flexible(
          flex: 2,
          child: registerintro(),
        ),
        Flexible(
          flex: 1,
          child: registerbutton(context),
        )
      ],
    );
  }

  // Text registration intro
  Text registerintro() {
    return Text(
      "Don't have an account?",
      style: TextStyle(
        fontFamily: 'Josefin',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // Bouton register
  TextButton registerbutton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Redirecting(),
          ),
        );
      },
      child: const DelayedAnimation(
        delay: 1050,
        child: Text(
          "Register",
          style: TextStyle(
            fontFamily: 'Josefin',
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
