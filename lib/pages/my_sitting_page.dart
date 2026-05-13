import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:project_azfh/pages/my_health.dart';
import 'package:project_azfh/widget/custom_butoom.dart';

class MySittingPage extends StatelessWidget {
  const MySittingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Sitting'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

        ///    عنوان القسم
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 25,
                
              ),
            ),
            SizedBox(height: 1),
            Text('Mange your app settings and preferences.'),

            SizedBox(height: 16),

            // الصندوق الفاتح
            Text('  APPEARANCE AND LANGUAGE', style: TextStyle(fontSize: 10, )),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 41, 100), // اللون الفاتح
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  

 
              //SizedBox(height: 16),
                  Container(
                      padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 2, 46), // اللون الفاتح
                borderRadius: BorderRadius.circular(16),
              ),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.dark_mode_outlined, size: 24),
                        Text(
                          'Dark Mode',
                          style: TextStyle(fontSize: 18),
                        ),
                        
                        Switch(
                          value: true,
                          onChanged: (val) {},
                        ),
                      ],  
                    ),
                  ),

               // 
SizedBox(height: 16),
                 
                  Container(
                      padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 2, 46), // اللون الفاتح
                borderRadius: BorderRadius.circular(16),
              ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Icon(Icons.language_sharp, size: 24),
                        Text(
                          'Language',
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              'English',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 8),
            Text('  ABOUT'),
            Container(
              //padding: EdgeInsets.symmetric(vertical: 130, horizontal: 140),

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 41, 100), // اللون الفاتح
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
              '  CLINICAL SANCTUARY V2.4.4 ',
              style: TextStyle(
                fontSize: 15,
               // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text('Clinical Sanctuary is a premium health management ecosystem designed to bridge the gap between high-level clinical data and patient-centered care through an elite user interface.'),
),
//SizedBox(height: 8),

 Padding(
   padding: const EdgeInsets.all(8.0),
   child: Divider(),
 ),
 // SizedBox(height: 8),

GestureDetector( onTap: (){},
child: Padding(
  padding: const EdgeInsets.all(2.0),
  child: Text('   Terms of Service', style: TextStyle( fontSize: 16)),
),
),

Padding(
   padding: const EdgeInsets.all(8.0),
   child: Divider(),
 ),
 
 GestureDetector( onTap: (){},
child: Padding(
  padding: const EdgeInsets.all(2.0),
  child: Text('   Terms of Service', style: TextStyle( fontSize: 16)),
),
),
                ],
              ),
            ),
SizedBox(height: 16),
CustomButton(text: 'Log Out', onTap: (){Get.to(MyHealth());}),


          ],
        ),
      ),
    );
  }
}
