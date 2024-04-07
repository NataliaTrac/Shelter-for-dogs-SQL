DROP TABLE IF EXIST Dog_Treatment;
DROP TABLE IF EXIST Specializations;
DROP TABLE IF EXIST Specialization;
DROP TABLE IF EXIST Treatment;
DROP TABLE IF EXIST ShelterCare;
DROP TABLE IF EXIST Adoption;
DROP TABLE IF EXIST Volunteer;
DROP TABLE IF EXIST Person;
DROP TABLE IF EXIST Dog;

CREATE TABLE Dog (
    chip_number integer NOT NULL,
    name varchar2(45) NOT NULL,
    birth_date date NOT NULL,
    gender varchar2(20) NOT NULL,
    admission_date date NOT NULL,
    CONSTRAINT Dog PRIMARY KEY (chip_number)
);

CREATE TABLE Person (
    id integer NOT NULL,
    first_name varchar2(45) NOT NULL,
    last_name varchar2(45) NOT NULL,
    phone_number varchar2(9) NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (id)
);

CREATE TABLE Volunteer (
    Person_id integer NOT NULL,
    status varchar2(15) NOT NULL,
    CONSTRAINT Volunteer_pk PRIMARY KEY (Person_id),
    CONSTRAINT Volunteer_Person FOREIGN KEY (Person_id) REFERENCES Person (id)
);

CREATE TABLE Treatment (
    id integer NOT NULL,
    treatment varchar2(45) NOT NULL,
    CONSTRAINT Treatment_pk PRIMARY KEY (id)
);

CREATE TABLE Specialization (
    id integer NOT NULL,
    specialization_name varchar2(100) NOT NULL,
    CONSTRAINT Specialization_pk PRIMARY KEY (id)
);

CREATE TABLE Dog_Treatment (
    Dog_chip_number integer NOT NULL,
    Treatment_id integer NOT NULL,
    CONSTRAINT Dog_Treatment_pk PRIMARY KEY (Dog_chip_number, Treatment_id),
    CONSTRAINT Dog_Treatment_Pies FOREIGN KEY (Dog_chip_number) REFERENCES Dog (chip_number),
    CONSTRAINT Dog_Treatment_Treatment FOREIGN KEY (Treatment_id) REFERENCES Treatment (id)
);

CREATE TABLE Specializations (
    Specialization_id integer NOT NULL,
    Volunteer_Person_id integer NOT NULL,
    CONSTRAINT Specializations_pk PRIMARY KEY (Specialization_id, Volunteer_Person_id),
    CONSTRAINT Specializations_Specialization FOREIGN KEY (Specialization_id) REFERENCES Specialization (id),
    CONSTRAINT Specializations_Volunteer FOREIGN KEY (Volunteer_Person_id) REFERENCES Volunteer (Person_id)
);

CREATE TABLE Adoption (
    id integer NOT NULL,
    Dog_chip_number integer NOT NULL,
    Person_id integer NOT NULL,
    adoption_status varchar2(25) NOT NULL,
    date date NOT NULL,
    Volunteer_Person_id integer NOT NULL,
    CONSTRAINT Adoption_pk PRIMARY KEY (id),
    CONSTRAINT Adoption_Osoba FOREIGN KEY (Person_id) REFERENCES Person (id),
    CONSTRAINT Adoption_Pies FOREIGN KEY (Dog_chip_number) REFERENCES Dog (chip_number),
    CONSTRAINT Adoption_Wolontariusz FOREIGN KEY (Volunteer_Person_id) REFERENCES Volunteer (Person_id)
);

CREATE TABLE ShelterCare (
    Volunteer_Person_id integer NOT NULL,
    Dog_chip_number integer NOT NULL,
    CONSTRAINT ShelterCare_pk PRIMARY KEY (Volunteer_Person_id, Dog_chip_number),
    CONSTRAINT ShelterCare_Dog FOREIGN KEY (Dog_chip_number) REFERENCES Dog (chip_number),
    CONSTRAINT ShelterCare_Volunteer FOREIGN KEY (Volunteer_Person_id) REFERENCES Volunteer (Person_id)
);

-- Insertions for the Dog table

INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (1, 'TOFIK', '2021-04-15', 'Male', '2023-02-01');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (2, 'Azor', '2012-05-15', 'Male', '2012-06-20');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (3, 'Luna', '2015-08-10', 'Female', '2015-09-15');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (4, 'Rex', '2018-03-03', 'Male', '2018-04-10');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (5, 'Coco', '2020-11-20', 'Female', '2020-12-25');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (6, 'Bella', '2019-01-01', 'Female', '2019-02-15');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (7, 'Rocky', '2016-06-25', 'Male', '2016-08-01');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (8, 'Mia', '2017-09-12', 'Female', '2017-10-20');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (9, 'Max', '2014-04-08', 'Male', '2014-05-15');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (10, 'Lola', '2019-11-17', 'Female', '2019-12-25');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (11, 'Buddy', '2016-02-09', 'Male', '2016-03-15');

-- Insertions for the Adoption table
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (1, 1, 1, 'Adopted', '2023-03-01', 1);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (2, 2, 2, 'Available for adoption', '2023-03-01', 3);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (3, 3, 3, 'In progress', '2023-03-01', 3);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (4, 4, 4, 'Available for adoption', '2023-03-01', 5);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (5, 5, 5, 'Adopted', '2023-03-01', 5);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (6, 6, 6, 'Available for adoption', '2023-03-01', 1);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (7, 7, 7, 'Adopted', '2023-03-01', 3);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (8, 8, 8, 'Available for adoption', '2023-03-01', 3);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (9, 9, 9, 'Adopted', '2023-03-01', 5);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (10, 10, 10, 'Available for adoption', '2023-03-01', 1);

-- Insertions for the Person table

INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (1, 'Anna', 'Kowalska', '123456789');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (2, 'Jan', 'Nowak', '987654321');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (3, 'Alicja', 'Wi niewska', '111222333');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (4, 'Piotr', 'Mazurek', '444555666');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (5, 'Karolina', 'D browska', '777888999');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (6, 'Marek', 'Lewandowski', '555444333');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (7, 'Ewa', 'Kaczor', '111222333');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (8, 'Pawe ', 'G rski', '999888777');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (9, 'Wiktoria', 'Jankowska', '333222111');
INSERT INTO Person (id, first_name, last_name, phone_number)
VALUES (10, 'Krzysztof', 'Nowicki', '666555444');

-- Insertions for the Volunteer table

INSERT INTO Volunteer (Person_id, status)
VALUES (1, 'Active');
INSERT INTO Volunteer (Person_id, status)
VALUES (3, 'Inactive');
INSERT INTO Volunteer (Person_id, status)
VALUES (5, 'Active');

-- Insertions for the Specialization table

INSERT INTO Specialization (id, specialization_name)
VALUES (1, 'Veterinarian');
INSERT INTO Specialization (id, specialization_name)
VALUES (2, 'Behaviorist');
INSERT INTO Specialization (id, specialization_name)
VALUES (3, 'Dog Trainer');

INSERT INTO Specialization (id, specialization_name) VALUES (1, 'Veterinarian');
INSERT INTO Specialization (id, specialization_name) VALUES (2, 'Behaviorist');
INSERT INTO Specialization (id, specialization_name) VALUES (3, 'Dog Trainer');


-- Insertions for the Treatment table

INSERT INTO Treatment (id, treatment)
VALUES (1, 'Vaccination');
INSERT INTO Treatment (id, treatment)
VALUES (2, 'Microchipping');
INSERT INTO Treatment (id, treatment)
VALUES (3, 'Sterilization');

-- Insertions for the Dog_Treatment table

INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (1, 1);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (2, 2);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (3, 3);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (4, 1);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (5, 2);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (6, 3);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (7, 1);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (8, 2);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (9, 3);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (10, 1);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id)
VALUES (11, 2);

-- Insertions for the ShelterCare table
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (1, 1);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (3, 2);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (5, 3);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (3, 4);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (5, 5);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (1, 6);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (3, 7);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (5, 8);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (3, 9);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number)
VALUES (1, 10);

-- Select all dogs born after a specific date
SELECT *
FROM Dog
WHERE birth_date > '2018-01-01';

-- Select all adopted dogs and their new owner's information
SELECT Dog.name AS Dog_Name, Person.first_name AS Owner_FirstName, Person.last_name AS Owner_LastName
FROM Adoption
JOIN Dog ON Adoption.Dog_chip_number = Dog.chip_number
JOIN Person ON Adoption.Person_id = Person.id
WHERE Adoption.adoption_status = 'Adopted';

-- Count adoptions by status
SELECT adoption_status, COUNT(*) AS NumberOfAdoptions
FROM Adoption
GROUP BY adoption_status;

-- Average number of dogs admitted per year
SELECT AVG(YearlyAdmissions) AS AverageAdmissionsPerYear
FROM (
    SELECT EXTRACT(YEAR FROM admission_date) AS Year, COUNT(*) AS YearlyAdmissions
    FROM Dog
    GROUP BY EXTRACT(YEAR FROM admission_date)
) AS AdmissionsPerYear;

-- Select dogs that have received a specific treatment
SELECT Dog.name AS Dog_Name
FROM Dog
JOIN Dog_Treatment ON Dog.chip_number = Dog_Treatment.Dog_chip_number
JOIN Treatment ON Dog_Treatment.Treatment_id = Treatment.id
WHERE Treatment.treatment = 'Vaccination';


