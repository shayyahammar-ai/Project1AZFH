import 'package:clinico/Models/Clinic.dart';
import 'package:clinico/list/doctorList.dart';

List <Clinic> myClinics=[

Clinic(
name: 'Cardiology ', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Cardiologist')
.toList()
),
Clinic(
name: 'Dentistry ', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Dintest')
.toList()
),
Clinic(
name: 'ENT', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Otorhinolaryngologist')
.toList()
),
Clinic(
name: 'Dermatology ', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Dermatologist')
.toList()
),
Clinic(
name: 'Clinical Nutrition', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Nutritionist')
.toList()
),
Clinic(
name: 'Gastroenterology', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Gastroenterologist')
.toList()
),
Clinic(
name: 'Gynecology', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Gynecologist')
.toList()
),
Clinic(
name: 'Ophthalmology', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Ophthalmologist')
.toList()
),
Clinic(
name: 'Pediatrics', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Pediatrician')
.toList()
),
Clinic(
name: 'Internal Medicine', 
doctors: doctors.where((doc)=>doc.medicalSpecialty=='Internist')
.toList()
),
];