import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color lightGreen = Color(0xfff13A6A8);

class DayCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const DayCard({
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? lightGreen : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: isSelected ? lightGreen : Colors.grey[200]!,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('E').format(date),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[500],
                fontSize: 13,
              ),
            ),
            SizedBox(height: 4),
            Text(
              DateFormat('d').format(date),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeCard({
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? lightGreen.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
          ],
          border: Border.all(
            color: isSelected ? lightGreen : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? lightGreen : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
