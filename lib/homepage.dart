import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:lvlmindbeta/loginpage.dart';
import 'package:lvlmindbeta/Models/Models.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  // Importation de la liste
  //List<CName> cname = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 80,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: "Hi there \n",
                    style: TextStyle(
                      fontFamily: 'Josefin',
                      color: Color.fromARGB(180, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(
                          text:
                              "Let's start a day exciting \n while learning with us",
                          style: TextStyle(
                            fontFamily: 'Josefin',
                            fontSize: 17,
                            color: Color.fromARGB(171, 0, 0, 0),
                          ))
                    ])),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 60,
                  child: Image(image: AssetImage('images/lvlmind.jpg')),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            // Catégories
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //const Padding(padding: EdgeInsets.all(30)),
                /*
                ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Card(
                      color: Colors.purpleAccent,
                      child: Text(
                        "TOP",
                        style: TextStyle(fontFamily: 'Josefin'),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 3,
                ),
                */
                Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13),
                    // TextButton
                    child: Text(
                      textAlign: TextAlign.center,
                      "TOP",
                      style: TextStyle(
                          fontFamily: 'Josefin',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  // TextButton
                  child: Text("Electronics",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Josefin',
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 20,
                  // TextButton
                  child: Text("Programming",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Josefin',
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
                // Pour ce menu: l'utilisateur peut personnaliser les catégories à afficher
                // en fonction du section
                SizedBox(
                    child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homepage(),
                        ));
                  },
                  alignment: Alignment.topCenter,
                  icon: const Icon(
                    Icons.menu,
                    weight: 20,
                    color: Colors.blueAccent,
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
