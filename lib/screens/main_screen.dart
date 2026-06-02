import 'package:clinico/screens/chat.dart';
import 'package:clinico/screens/favourite.dart';
import 'package:clinico/screens/home_page.dart';
import 'package:clinico/screens/medical_info.dart';
import 'package:clinico/screens/myProfile.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
   final List<Widget> _pages =[
    const HomePage(),
    const MedicalInfo(),
    const Favourite(),
    const MyProfile(),
    const Chat(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
     body: _pages[_currentIndex],
     bottomNavigationBar: SalomonBottomBar(
       currentIndex: _currentIndex,
       onTap: (i) => setState(() => _currentIndex = i),
       backgroundColor:Color.fromARGB(255, 6, 79, 73), 
       unselectedItemColor: Colors.white.withOpacity(0.5),
       items: [
        
           SalomonBottomBarItem(
            icon: const Icon(Icons.home)
            , title: const Text('Home'),
            selectedColor: Colors.white,
            ),

           SalomonBottomBarItem(
            icon: const Icon(Icons.info)
            ,title: const Text('Medical Info'),
            selectedColor: const Color.fromARGB(255, 2, 32, 83),
            ),

             SalomonBottomBarItem(
            icon: const Icon(Icons.favorite)
            , title: const Text('Favourite'),
             selectedColor: const Color.fromARGB(255, 235, 111, 102),
            ),

             SalomonBottomBarItem(
            icon: const Icon(Icons.person)
            ,title: const Text('Profile'),
                        selectedColor: const Color.fromARGB(255, 213, 98, 233),

            ),

             SalomonBottomBarItem(
            icon: const Icon(Icons.chat)
            , title: const Text('Chat'),
            selectedColor: const Color.fromARGB(255, 178, 231, 119),
            ),
       ],
    
     )

    );
  }}
 