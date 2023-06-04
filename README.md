# Fuel Station Example System
An example system for fuel station control, focusing on being a Minimum Viable Product (MVP).

Developed using Delphi 10.4 x32, utilizing Firebird 3 as the database and Fortes Report as the report generator.

## How to test
- Install the dependency in Delphi.
- Create the database using the file found in Model\Database\Database.sql. Edit the file to specify the location of the Firebird x32 DLL and where the database will be created. By default, it will be created at C:\DB.
- When compiling the project, create an "DFP.ini" file with a "Config" section, specifying the database path in "DBPath," the database user in "DBuser," and the database password in "DBPass."

## Features

- Tracks refueling operations conducted each day, identifying the pump used, the quantity of liters, and the amount fueled.
- Calculates a tax on the fueled amount (fixed at 15% in this example).
- Generates refueling reports with filtering options for date range and grouping by Date, Tank, and Pump used.

## Dependencies
- [Fortes Report CE](https://github.com/fortesinformatica/fortesreport-ce)

## Applied Architecture and Design
- MVC (Model-View-Controller)
- SOLID principles
- Abstract Factory
- Fluent Interfaces
- ORM (Object-Relational Mapping) for abstracting the database layer and manipulating objects
- Unit Tests
- RTTI (Run-Time Type Information)
- Generics
- Helpers
- Custom Exceptions
- Interfaces
- Object-Oriented Programming (OOP)
- Clean Code
