#TODO:today
- Software Design Tutorial #1 - Software Engineering & Software Architecture
- This is the software engineering mindset you need


students , professors -> which courses the professor teaches  and courses -> students enrolled in course

student & professor -> address , phone number , name and age 

course -> has maximum and minimum number of students they can enroll 
if the minimum number of students is not reached then the course will be cancelled  (a course can not be instantiated without the minimum number required students)


course -> is taught by one professor but sometimes can be taught by many 
we need to keep track of how much professors make per year : if a teacher teaches more than 4 courses  then they are granted a one time bonus of 20,000


students : local / international ; full time or part time 
student -> part time : if they are enrolled in less than 1 or 2 


three classes : student , professor , course 
student : address , phone number , name , age , local/international , full-time/part-time
professor : address , phone number , name , age , salary 
course : min ,max , instance(s) of professor 


class ProfessorOrStudent {
    String name;
    Int age;
    String address;

    ProfessorOrStudent({})





}



1) identify all the classes 
2) find all the attributes of the classes 
3) determine the associations of the classes that you have identified 



system : Hospital Management System
1) Patient , Doctor , Appointment , Staff (parent for doctor , nurse , administrastive staff) , Payment  , Inventory 



Patient -> a class for managing patient information (repository)
- first name 
- last name 
- data of Birth 
- phone number ( parent / patient)

Doctor / Nurse / Pharmacist / Admin Staff -> role 
class to manage doctor's schedule and availability 
Payment 
- amount
- method : ['credit card','cash','insurance']
Inventory
Record
Appointment
 - date
 - time
 - patient id 
 - doctor id 

Admission
Discharge
Transfer
