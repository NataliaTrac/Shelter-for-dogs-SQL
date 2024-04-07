# Dog Shelter Database Project

## Dog Shelter Database Project Assumptions

### Introduction
The Dog Shelter Database is designed to manage and store information regarding the operations of a dog shelter. This database aims to facilitate the tracking of dogs, volunteers, treatments, and adoptions within the shelter. The structure of the database is designed to ensure efficient data retrieval, update, and maintenance processes. Below are the detailed assumptions and the rationale behind the design of this database.

### Assumptions
1. **Unique Identification**:
    - Every dog in the shelter is uniquely identified by a `chip_number`.
    - Every person (including volunteers and adopters) is uniquely identified by an `id`.

2. **Dog Information**:
    - The database stores essential information about each dog, including name, birth date, gender, and admission date.

3. **Person Information**:
    - The database keeps a record of people associated with the shelter, including their first name, last name, and phone number.

4. **Volunteer Management**:
    - Volunteers are special cases of people who have taken an active role in the shelter.
    - Each volunteer is identified by their `Person_id`, ensuring a direct link to their personal information.
    - Volunteers have statuses to indicate whether they are currently active.

5. **Treatment Records**:
    - The database maintains a list of treatments that can be administered to dogs, such as vaccinations, microchipping, and sterilization.
    - A dog can receive multiple treatments, and this relationship is managed through the `Dog_Treatment` table.

6. **Adoption Process**:
    - The adoption table records each adoption case, linking dogs to their new owners and the volunteer who facilitated the adoption.
    - Each adoption case has a status (e.g., 'Adopted', 'Available for adoption', 'In progress') to track the current state of the adoption process.

7. **Volunteer Specializations**:
    - Volunteers can have specializations (e.g., Veterinarian, Behaviorist, Dog Trainer), allowing the shelter to utilize their skills effectively.
    - The `Specializations` table links volunteers to their respective specializations.

8. **Shelter Care**:
    - The database tracks which volunteer is taking care of which dog through the `ShelterCare` table, indicating direct responsibility and care activities.


## Table of Contents
- [Project Title](#dog-shelter-database-project)
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Documentation](#documentation)
- [Examples](#examples)
- [Troubleshooting](#troubleshooting)

## Installation
To install and use this project, you'll need a SQL database system that supports `VARCHAR2` data types, such as Oracle Database. Follow the installation process for your database system, and then execute the SQL statements provided to create the schema.

## Usage
After setting up the database schema, you can use SQL queries to insert, update, delete, or select data from the tables. The project allows managing dog records, volunteer information, treatments, and adoptions.

## Features
- **Dog Management**: Keep track of dogs' chip numbers, names, birth dates, genders, and admission dates.
- **Person Management**: Store information about people involved with the shelter, including volunteers and adopters.
- **Volunteer Management**: Manage volunteer status and link them to people records.
- **Treatment Management**: Define treatments that can be administered to dogs.
- **Adoption Management**: Record adoptions, linking dogs to their new owners and the volunteers who facilitated the adoption.
- **Specialization Management**: Define specializations for volunteers, such as veterinarian, behaviorist, or dog trainer.
- **Advanced Queries**: Includes SQL queries for reporting, such as listing all adopted dogs, counting adoptions by status, and finding the average number of dogs admitted per year.

## Dependencies
- Oracle Database or another database system that supports `VARCHAR2`.
- SQL client for executing SQL statements.

## Configuration
No additional configuration is needed outside of the standard database setup.

## Documentation
The SQL commands provided define the schema and include examples of insertions for each table. Additionally, there are SELECT statements for common queries like listing all dogs born after a specific date and counting adoptions by status.

## Examples
To add a new dog to the database:
```sql
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (12, 'Fido', '2022-01-01', 'Male', '2022-02-20');
```

## Troubleshooting
+ Ensure all foreign keys match primary keys in related tables.
+ Verify the data types and constraints before inserting data to prevent errors.
