
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lvlmindbeta/pages/homePage.dart';
import 'package:lvlmindbeta/pages/schedulePage.dart';
import 'package:lvlmindbeta/pages/filesPage.dart';
import 'package:lvlmindbeta/pages/profilePage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _NavBarState();
}

class _NavBarState extends State<BottomNavBar> {
int pageIndex = 0;
final list_screens = [
  Homepage(),
  Schedule(),
  Files(),
  Profile(),  
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            items: [
              (pageIndex == 0) ? const BottomNavigationBarItem(icon: Icon(Iconsax.home_1), label: "Home", tooltip: "Home") : const BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home", tooltip: "Home"),
              (pageIndex == 1) ? const BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar_circle_fill), tooltip: "Schedule", label: "Schedule"): const BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar_circle), tooltip: "Schedule", label: "Schedule"),
              (pageIndex == 2) ? const BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder_fill), tooltip: "Files", label: "Files"): const BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder), tooltip: "Files", label: "File" ),
              (pageIndex == 3) ? const BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_circle_fill), tooltip: "Profile", label: "Profile"): const BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), tooltip: "Profile", label: "Profile")
            ], 
            onTap: (value){
              setState(() {
                pageIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white, 
            selectedFontSize: 15,
            iconSize: 25,
            currentIndex: pageIndex,
            backgroundColor: Colors.blueAccent,
            showUnselectedLabels: false, 
            showSelectedLabels: true,),
        ),
      ),
      body: list_screens[pageIndex], // Page affichée en fonction du numéro dans la liste 
    );
  }
}