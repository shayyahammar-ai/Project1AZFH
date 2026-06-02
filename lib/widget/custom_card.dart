import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class custumCard extends StatelessWidget {
  String title;
  String image;
   Widget page;
  custumCard({super.key, required this.title, required this.image, required this.page});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
       Get.to(page);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 120,
            width: 120,
            child: Card(
              elevation: 12,
              //color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
      
                    SizedBox(height: 1),
      
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Image.asset(image, height: 35, width: 60,),
                       SizedBox(height: 10),
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
