-- Estudiante: Joseph Benitez Arroyo 
-- Reg: 221043837

create database airport;
use airport;

create table Customer(
id int identity(1,1) primary key,
Date_of_Birth date not null,
Name varchar(30) not null,
);

create table Airport(
id int identity(1,1) primary key,
Name varchar(30) not null,
);

create table Plane_Model(
id int identity(1,1) primary key,
Description varchar(60) not null,
Graphic varchar(50) not null,
);

create table Frequent_Flyer_Card(
FFC_Number int identity(1,1) primary key,
Miles int not null,
Meal_Code int not null,
Customer_id int not null,
foreign key (Customer_id) references Customer(id)
);

create table Airplane(
Registration_Number int identity(1,1) primary key,
Begin_of_Operation date not null,
Status varchar(30) not null,
Plane_Model_id int not null,
foreign key (Plane_Model_id) references Plane_Model(id),
);

create table Flight_Number(
id int identity(1,1) primary key,
Departure_Time time not null,
Description varchar(50) not null,
Type bit not null,
Airline varchar(20) not null,
Airport_Start int not null,
Airport_Goal int not null,
foreign key (Airport_Start) references Airport(id),
foreign key (Airport_Goal) references Airport(id),
);

create table Ticket(
Ticketing_Code int identity(1,1) primary key,
Number int not null,
Customer_id int not null,
foreign key (Customer_id) references Customer(id)
);

create table Flight(
id int identity(1,1) primary key,
Boarding_Time time not null,
Flight_Date date not null,
Gate tinyint not null,
Check_In_Counter bit not null,
Flight_Number_id int not null,
foreign key (Flight_Number_id) references Flight_Number(id),
);

create table Seat(
id int identity(1,1) primary key,
Size int not null,
Number int not null,
Location varchar(30) not null,
Plane_Model_id int not null,
foreign key (Plane_Model_id) references Plane_Model(id),
);

create table Available_Seat(
id int identity(1,1) primary key,
Flight_id int not null,
Seat_id int not null,
foreign key (Flight_id) references Flight(id),
foreign key (Seat_id) references Seat(id),
);

create table Coupon(
id int identity(1,1) primary key,
Date_of_Redemption date not null,
Class varchar(20) not null,
Standby varchar(20) not null,
Meal_Code int not null,
Ticketing_Code int not null,
Available_Seat_id int not null,
Flight_id int not null,
foreign key (Ticketing_Code) references Ticket(Ticketing_Code),
foreign key (Available_Seat_id) references Available_Seat(id),
foreign key (Flight_id) references Flight(id),
);


create table Pieces_of_Luggage(
id int identity(1,1) primary key,
Number int not null,
Weight int not null,
Coupon_id int not null,
foreign key (Coupon_id) references Coupon(id),
);