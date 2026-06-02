import 'package:clinico/widgets/clinicwidget2.dart';
import 'package:clinico/widgets/doctorwidget.dart';
import 'package:flutter/material.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 79, 73),
          title: Text("Doctors", style: TextStyle(color: Colors.white)),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color.fromARGB(255, 2, 33, 47),
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            labelPadding: EdgeInsets.symmetric(horizontal: 50),
            tabs: [
              Tab(text: "ALL"),
              Tab(text: "Specialty"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return UnconstrainedBox(child: DoctorCard());
              },
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: 10,
                itemBuilder: ((context, index) => ClinicCardDoctor()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
