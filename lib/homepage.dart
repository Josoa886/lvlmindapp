import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lvlmindbeta/loginpage.dart';
import 'package:lvlmindbeta/Models/Models.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lvlmindbeta/pages/files.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        // Pour obtenir des bords arrondis
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: NavigationBar(
            backgroundColor: const Color.fromARGB(255, 205, 219, 226),
            elevation: 5,
            indicatorColor: const Color.fromARGB(255, 255, 255, 255),
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                label: 'Home',
              ),
              NavigationDestination(icon: Icon(Iconsax.calendar), label: 'EDT'),
              NavigationDestination(
                  icon: Icon(Iconsax.folder_2), label: 'Files'),
              NavigationDestination(
                  icon: Icon(Iconsax.profile_circle), label: 'Profile')
            ]),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 80,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 50,
                child: Image(image: AssetImage('images/menubutton.jpg')),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(TextSpan(
                    text: "Hi there \n\n",
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
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 90,
                    child: Image.asset(
                      'images/avatar1.jpg',
                      alignment: Alignment.topRight,
                    ))
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
                Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  color: const Color.fromARGB(255, 121, 38, 238),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(1),
                      // TextButton
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          textAlign: TextAlign.center,
                          "TOP",
                          style: TextStyle(
                              fontFamily: 'Josefin',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(
                    height: 30,
                    // TextButton
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Electronics",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Josefin',
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    )),
                SizedBox(
                    height: 30,
                    // TextButton
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Programming",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Josefin',
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    )),
                // Pour ce menu: l'utilisateur peut personnaliser les catégories à afficher
                // en fonction du section
                SizedBox(
                    child: IconButton(
                  onPressed: () {},
                  alignment: Alignment.center,
                  icon: const Icon(
                    Icons.menu,
                    weight: 20,
                    color: Colors.blueAccent,
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),

            // Passons aux catégories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Category",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Josefin',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(166, 0, 0, 0),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      // Redirection vers une page contenant toutes les catégories
                      // Categories = Matières
                      onPressed: () {},
                      child: const Text(
                        "See all",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Josefin',
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(223, 222, 75, 161),
                        ),
                      ),
                    ))
              ],
            ),

            // Liste des catégories
            const SizedBox(
              // Pour limiter la hauteur de la liste
              // Permet d'éviter la présence des erreurs au niveau du rendu
              // Recommandé lors de
              height: 450,
              child: Category(),
            )
          ],
        ),
      ),
    );
  }
}

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => CategoryState();
}

class CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                ),
                const Text("Category"),
              ],
            ),
          );
        });
  }
}
