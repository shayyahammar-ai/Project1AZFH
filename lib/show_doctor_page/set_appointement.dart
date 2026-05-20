import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_azfh/show_doctor_page/Day&Time_Dards.dart';

Color lightGreen = Color(0xfff13A6A8);

class set_appointement extends StatefulWidget {
  const set_appointement({super.key});

  @override
  State<set_appointement> createState() => _set_appointementState();
}

class _set_appointementState extends State<set_appointement> {
  final ScrollController _dayScrollController = ScrollController();
  final List<DateTime> days = List.generate(
    30,
    (index) => DateTime.now().add(Duration(days: index + 1)),
  );
  final List<String> times = [
    "09:00 am",
    "10:30 am",
    "01:00 pm",
    "02:30 pm",
    "04:00 pm",
    "05:30 pm",
    "07:00 pm",
    "08:30 pm",
    "10:00 pm",
  ];

  int selectedDayIndex = 0;
  int selectedTimeIndex = -1;
  bool isConfirmed = false;

  void _scrollDays(bool forward) {
    double moveDistance = (MediaQuery.of(context).size.width / 4 + 8) * 3;
    double newOffset = forward
        ? _dayScrollController.offset + moveDistance
        : _dayScrollController.offset - moveDistance;

    _dayScrollController.animateTo(
      newOffset.clamp(0.0, _dayScrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _showBookingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            "Confirm Appointment",
            style: TextStyle(color: lightGreen, fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you Sure of Booking this appointment?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  isConfirmed = true;
                });
              },
              child: Text(
                "Confirm",
                style: TextStyle(
                  color: lightGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            "Cancel Appointment",
            style: TextStyle(color: lightGreen, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "Are you sure you want to cancel? \nAll selected values will be cleared.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("No", style: TextStyle(color: Colors.black87)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  isConfirmed = false;
                  selectedDayIndex = 0;
                  selectedTimeIndex = -1;
                });
              },
              child: const Text(
                "Yes, Cancel",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: isConfirmed
            ? Column(
                children: [
                  Icon(Icons.check_circle, color: lightGreen, size: 60),
                  SizedBox(height: 15),
                  Text(
                    "Appointment Confirmed!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: lightGreen,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Date: ${DateFormat('EEEE, d MMMM').format(days[selectedDayIndex])}",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  Text(
                    "Time: ${selectedTimeIndex != -1 ? times[selectedTimeIndex] : 'Not Selected'}",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isConfirmed = false;
                            });
                          },
                          icon: Icon(Icons.edit),
                          color: lightGreen,
                          iconSize: 20,
                        ),
                        IconButton(
                          onPressed: _showCancelDialog,
                          icon: Icon(Icons.cancel),
                          color: Colors.red,
                          iconSize: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Available Appointments",
                        style: TextStyle(
                          color: lightGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 14,
                              color: lightGreen,
                            ),
                            onPressed: () => _scrollDays(false),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: lightGreen,
                            ),
                            onPressed: () => _scrollDays(true),
                          ),
                          SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: selectedTimeIndex == -1
                                ? null
                                : _showBookingDialog,
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightGreen,
                              elevation: 5,
                              shadowColor: lightGreen.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    DateFormat('MMM').format(DateTime.now()) +
                        ' ' +
                        DateFormat('y').format(DateTime.now()),
                    style: TextStyle(color: lightGreen, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      controller: _dayScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      itemBuilder: (context, index) {
                        return DayCard(
                          date: days[index],
                          isSelected: index == selectedDayIndex,
                          onTap: () => setState(() => selectedDayIndex = index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.2,
                    ),
                    itemCount: times.length,
                    itemBuilder: (context, index) {
                      return TimeCard(
                        time: times[index],
                        isSelected: index == selectedTimeIndex,
                        onTap: () => setState(() => selectedTimeIndex = index),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
      ),
    );
  }
}
