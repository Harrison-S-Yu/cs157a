CREATE TABLE `department` (
    `department_id` int  NOT NULL ,
    `dname` varchar(60)  NOT NULL ,
    `dept_description` varchar(110)  NOT NULL ,
    `dept_head` int  NOT NULL ,
    PRIMARY KEY (
        `department_id`
    )
);

CREATE TABLE `employee` (
    `employee_id` int  NOT NULL ,
    `fname` varchar(60)  NOT NULL ,
    `lname` varchar(60)  NOT NULL ,
    `age` int  NOT NULL ,
    `address` varchar(110)  NOT NULL ,
    `gender` varchar(60)  NOT NULL ,
    `title` varchar(60)  NOT NULL ,
    `patient_type` varchar(60)  NOT NULL ,
    `department` int  NOT NULL ,
    PRIMARY KEY (
        `employee_id`
    )
);

CREATE TABLE `appointment` (
    `appointment_id` int  NOT NULL ,
    `appointment_date` varchar(60)  NOT NULL ,
    `appointment_time` varchar(60)  NOT NULL ,
    `employee_id` int  NOT NULL ,
    PRIMARY KEY (
        `appointment_id`
    )
);

CREATE TABLE `room` (
    `room_id` int  NOT NULL ,
    `room_dept` int  NOT NULL ,
    PRIMARY KEY (
        `room_id`
    )
);

CREATE TABLE `treatments` (
    `treat_id` int  NOT NULL ,
    `treat_type` varchar(60)  NOT NULL ,
    PRIMARY KEY (
        `treat_id`
    )
);

CREATE TABLE `patients` (
    `patient_id` int  NOT NULL ,
    `fname` varchar(60)  NOT NULL ,
    `lname` varchar(60)  NOT NULL ,
    `patient_type` varchar(60)  NOT NULL ,
    `age` int  NOT NULL ,
    `address` varchar(110)  NOT NULL ,
    PRIMARY KEY (
        `patient_id`
    )
);

CREATE TABLE `check_ups` (
    `check_id` int  NOT NULL ,
    `patient_id` int  NOT NULL ,
    `appointment_id` int  NOT NULL ,
    `treat_id` int  NOT NULL ,
    `med_id` int  NOT NULL ,
    `date` varchar(60)  NOT NULL ,
    `equipment_id` int  NOT NULL ,
    PRIMARY KEY (
        `check_id`
    )
);

CREATE TABLE `equipments` (
    `equip_id` int  NOT NULL ,
    `equip_name` varchar(60)  NOT NULL ,
    `requested_date` varchar(60)  NOT NULL ,
    `date_defected` varchar(60)  NOT NULL ,
    PRIMARY KEY (
        `equip_id`
    )
);

CREATE TABLE `medicines` (
    `med_id` int  NOT NULL ,
    `med_name` varchar(60)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `med_id`
    )
);


ALTER TABLE `employee` ADD CONSTRAINT `fk_employee_department` FOREIGN KEY(`department`)
REFERENCES `department` (`department_id`);

ALTER TABLE `appointment` ADD CONSTRAINT `fk_appointment_employee_id` FOREIGN KEY(`employee_id`)
REFERENCES `employee` (`employee_id`);

ALTER TABLE `room` ADD CONSTRAINT `fk_room_room_dept` FOREIGN KEY(`room_dept`)
REFERENCES `department` (`department_id`);

ALTER TABLE `check_ups` ADD CONSTRAINT `fk_check_ups_patient_id` FOREIGN KEY(`patient_id`)
REFERENCES `patients` (`patient_id`);

ALTER TABLE `check_ups` ADD CONSTRAINT `fk_check_ups_appointment_id` FOREIGN KEY(`appointment_id`)
REFERENCES `appointment` (`appointment_id`);

ALTER TABLE `check_ups` ADD CONSTRAINT `fk_check_ups_treat_id` FOREIGN KEY(`treat_id`)
REFERENCES `treatments` (`treat_id`);

ALTER TABLE `check_ups` ADD CONSTRAINT `fk_check_ups_med_id` FOREIGN KEY(`med_id`)
REFERENCES `medicines` (`med_id`);

ALTER TABLE `check_ups` ADD CONSTRAINT `fk_check_ups_equipment_id` FOREIGN KEY(`equipment_id`)
REFERENCES `equipments` (`equip_id`);

INSERT INTO department (department_id, dname, dept_description, dept_head) 
VALUES 
(1, 'Cardiology', 'Deals with the disorders of the heart and the circulatory system.', 101),
(2, 'Neurology', 'Deals with disorders of the nervous system.', 102),
(3, 'Oncology', 'Deals with the study, diagnosis, and treatment of cancer.', 103),
(4, 'Pediatrics', 'Deals with medical care of infants, children, and adolescents.', 104),
(5, 'Dental', 'Deals with the diagnosis and treatment of dental problems.', 105),
(6, 'Office', 'Deals with records and patient check-in.', 106);

INSERT INTO employee (employee_id, fname, lname, age, address, gender, title, patient_type, department) 
VALUES 
(101, 'John', 'Doe', 45, '123 Main St, Anytown USA', 'Male', 'Doctor', 'Adult', 1),
(102, 'Jane', 'Smith', 38, '456 Maple St, Anycity USA', 'Female', 'Doctor', 'Adult', 2),
(103, 'Bob', 'Johnson', 52, '789 Oak St, Anystate USA', 'Male', 'Doctor', 'Adult', 3),
(104, 'Sarah', 'Lee', 29, '321 Elm St, Anyville USA', 'Female', 'Doctor', 'Pediatric', 4),
(105, 'Mike', 'Brown', 41, '654 Pine St, Anyplace USA', 'Male', 'Doctor', 'Adult', 5),
(106, 'Lisa', 'Garcia', 48, '987 Walnut St, Anytown USA', 'Female', 'Receptionist', 'All', 6);

INSERT INTO appointment (appointment_id, appointment_date, appointment_time, employee_id) 
VALUES 
(6213572, '2023-05-15', '10:00:00', 101),
(1324124, '2023-05-16', '11:00:00', 102),
(9561223, '2023-05-17', '12:00:00', 103);

INSERT INTO room (room_id, room_dept) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO treatments (treat_id, treat_type) 
VALUES 
(1, 'Chemotherapy'),
(2, 'Radiation therapy'),
(3, 'Surgery'),
(4, 'Physical therapy'),
(5, 'Counseling');

INSERT INTO patients (patient_id, fname, lname, patient_type, age, address) 
VALUES 
(165215, 'Mark', 'Johnson', 'Adult', 45, '1111 Main St, Anytown USA'),
(132154, 'Lisa', 'Williams', 'Pediatric', 12, '2222 Elm St, Anytown USA'),
(841321, 'Sam', 'Smith', 'Adult', 30, '3333 Oak St, Anytown USA');

INSERT INTO medicines (med_id, med_name, quantity) 
VALUES 
(152, 'Aspirin', 462),
(135, 'Benzydamine', 131),
(123, 'Oxycodone', 19);

INSERT INTO equipments (equip_id, equip_name, requested_date, date_defected) 
VALUES 
(22, 'MRI', '2021-09-25', '2029-09-27'),
(25, 'X-Ray', '2020-02-03', '2028-03-11'),
(28, 'CAT Scanner', '2012-01-08', '2031-06-21');


INSERT INTO check_ups (check_id, patient_id, appointment_id, treat_id, med_id, date, equipment_id) 
VALUES 
(3026, 165215, 6213572, 3, 152, '2023-05-14', 22),
(3112, 132154, 1324124, 4, 135, '2023-05-14', 25),
(3888, 841321, 9561223, 5, 123, '2023-05-12', 25);

CREATE VIEW Doctor_View AS 
SELECT employee_id, fname, lname, age, address, gender, title, patient_type, department
FROM employee
WHERE title = 'Doctor';

CREATE VIEW Doctor_Appointments AS 
SELECT c.check_id, p.patient_id, r.room_id, p.fname AS patient_fname, p.lname AS patient_lname, p.patient_type, m.med_name, eq.equip_name, t.treat_type, a.appointment_id, a.appointment_date, a.appointment_time, e.employee_id, e.fname AS doctor_fname, e.lname AS doctor_lname, d.dname AS department_name
FROM check_ups c
JOIN patients p ON c.patient_id = p.patient_id
JOIN appointment a ON c.appointment_id = a.appointment_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN department d ON e.department = d.department_id
JOIN medicines m ON c.med_id = m.med_id
JOIN equipments eq ON c.equipment_id = eq.equip_id
JOIN treatments t ON c.treat_id = t.treat_id
JOIN room r ON d.department_id = r.room_dept;

CREATE VIEW Receptionist_View AS 
SELECT employee_id, fname, lname, age, address, gender, title, patient_type, department
FROM employee
WHERE title = 'Receptionist';

CREATE VIEW Receptionist_Appointments AS
SELECT c.check_id, p.patient_id, p.fname AS patient_fname, p.lname AS patient_lname, p.patient_type, a.appointment_id, a.appointment_date, a.appointment_time, e.employee_id, e.fname AS doctor_fname, e.lname AS doctor_lname, e.title, d.dname AS department_name
FROM check_ups c
JOIN patients p ON c.patient_id = p.patient_id
JOIN appointment a ON c.appointment_id = a.appointment_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN department d ON e.department = d.department_id;

CREATE VIEW Patient_Appointments AS 
SELECT c.check_id, p.patient_id, r.room_id, p.fname AS patient_fname, p.lname AS patient_lname, p.patient_type, m.med_name, t.treat_type, a.appointment_id, a.appointment_date, a.appointment_time, e.fname AS doctor_fname, e.lname AS doctor_lname, d.dname AS department_name
FROM check_ups c
JOIN patients p ON c.patient_id = p.patient_id
JOIN appointment a ON c.appointment_id = a.appointment_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN department d ON e.department = d.department_id
JOIN medicines m ON c.med_id = m.med_id
JOIN treatments t ON c.treat_id = t.treat_id
JOIN room r ON d.department_id = r.room_dept;


