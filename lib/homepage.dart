import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:lvlmindbeta/loginpage.dart';
import 'package:lvlmindbeta/Models/Models.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lvlmindbeta/pages/files.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          backgroundColor: const Color.fromARGB(255, 205, 219, 226),
          elevation: 5,
          indicatorColor: const Color.fromARGB(255, 255, 255, 255),
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(icon: Icon(Iconsax.calendar), label: 'EDT'),
            NavigationDestination(icon: Icon(Iconsax.folder_2), label: 'Files'),
            NavigationDestination(
                icon: Icon(Iconsax.profile_circle), label: 'Profile')
          ]),
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
                  onPressed: () {},
                  alignment: Alignment.topCenter,
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

class category_img {
  String title;
  String image;

  category_img(this.image, this.title);
}

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => CategoryState();
}

class CategoryState extends State<Category> {
  final List<category_img> category = [
    category_img('images/Other03.jpg', 'Electronic'),
    category_img('images/Other03.jpg', 'Programation'),
    category_img('images/Other09.jpg', 'Management'),
    category_img('images/Other11.jpg', 'Mathématic')
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10),
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(category[index].image),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                ),
                Text(category[index].title),
              ],
            ),
          );
        });
  }
}
