use meditrack;



create table departments(
dept_id int primary Key auto_increment,
dept_name varchar(100) not null,
location varchar(100)
);

create table doctors(
doctor_id int primary key auto_increment,
doctor_name varchar(100),
specialization varchar(100),
phone varchar(10),
dept_id int,
foreign key (dept_id) references departments(dept_id)
);

create table patients(
patient_id int primary key auto_increment,
patient_name varchar(100) not null,
age int,
gender varchar(10),
phone varchar(15),
diseases varchar(100)
);


create table appointments(
appointment_id int primary key auto_increment,
doctor_id int,
patient_id int,
appointment_date Date,
status varchar(10),
foreign key (patient_id) references patients(patient_id),
foreign key (doctor_id) references doctors(doctor_id)
);


Alter table doctors
Modify phone varchar(15) not null,
Modify specialization varchar(100) not null;

Alter table patients
Modify age int not null,
Modify gender varchar(10) not null,
modify phone varchar(16),
modify diseases varchar(100) not null;

Alter table appointments
Modify appointment_date datetime Default current_timestamp,
Modify status varchar(20) not null;

insert into departments(dept_id,dept_name,location) values 
(1,'Cardiology','Block A - Floor 2');

insert into departments(dept_name,location) values 
('Cardiology','Block A - Floor 2'),
('Neurology', 'Block B - Floor 3'),
('Orthopedics', 'Block C - Floor 1'),
('Pediatrics', 'Block A - Floor 1'),
('Emergency', 'Ground Floor'),
('Radiology', 'Block D - Floor 2'),
('Oncology', 'Block E - Floor 4'),
('Dermatology', 'Block B - Floor 1');

insert into doctors(doctor_name,specialization,phone,dept_id) values
('Dr. Amit Sharma', 'Cardiologist', '9876543210', 1),
('Dr. Neha Verma', 'Neurologist', '9876543211', 2),
('Dr. Raj Patel', 'Orthopedic', '9876543212', 3),
('Dr. Sneha Gupta', 'Pediatrician', '9876543213', 4),
('Dr. Vikram Singh', 'Emergency Specialist', '9876543214', 5),
('Dr. Anjali Mehta', 'Radiologist', '9876543215', 6),
('Dr. Karan Malhotra', 'Oncologist', '9876543216', 7),
('Dr. Pooja Jain', 'Dermatologist', '9876543217', 8);


INSERT INTO patients (patient_name, age, gender, phone, diseases) VALUES
('Rohit Yadav', 22, 'Male', '9123456780', 'Fever'),
('Anita Sharma', 30, 'Female', '9123456781', 'Migraine'),
('Mohit Verma', 45, 'Male', '9123456782', 'Fracture'),
('Pooja Singh', 10, 'Female', '9123456783', 'Cold'),
('Rahul Gupta', 50, 'Male', '9123456784', 'Heart Problem'),
('Neha Jain', 28, 'Female', '9123456785', 'Skin Allergy');


INSERT INTO appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2026-04-10', 'Completed'),
(2, 2, '2026-04-11', 'Pending'),
(3, 3, '2026-04-12', 'Completed'),
(4, 4, '2026-04-13', 'Pending'),
(5, 1, '2026-04-14', 'Completed'),
(6, 6, '2026-04-15', 'Pending');

SELECT doctor_id, doctor_name FROM doctors;

SELECT 
    p.patient_name,
    d.doctor_name,
    d.specialization,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

SELECT 
    d.doctor_name,
    d.specialization,
    dep.dept_name
FROM doctors d
JOIN departments dep ON d.dept_id = dep.dept_id;

SELECT 
    p.patient_name,
    d.doctor_name,
    dep.dept_name,
    a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN departments dep ON d.dept_id = dep.dept_id;


SELECT doctor_name AS name, 'Doctor' AS role
FROM doctors
UNION ALL
SELECT patient_name AS name, 'Patient' AS role
FROM patients;


SELECT patient_id, 'Appointment Done' AS status
FROM appointments
WHERE status = 'Completed'
UNION ALL
SELECT patient_id, 'Appointment Pending' AS status
FROM appointments
WHERE status = 'Pending';