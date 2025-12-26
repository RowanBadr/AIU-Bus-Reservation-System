create database if not exists BusReservation;
use BusReservation;
create table TransportsAdmin(
AdminID int primary key not null,
AdminPhoneNumber varchar(20) unique not null,
AdminEmail varchar(45)unique not null,
AdminFirstName varchar(15) not null,
AdminLastName varchar(15) not null 
);

create table BusSupervisor(
SupervisorID int primary key not null,
SupervisorEmail varchar(45)unique not null,
SupervisorPhoneNumber varchar(20) unique not null,
SupervisorFirstName varchar(15) not null,
SupervisorLastName varchar(15) not null,
SupervisorStreet varchar(20) not null,
SupervisorArea varchar(20) not null,
SupervisorSalary int not null,
SupervisorPickupLocation varchar(20) not null,
AdminID int,
foreign key BusSupervisor(AdminID) references TransportsAdmin(AdminID),
ReportDate date not null
);

create table Vehicle(
PlateNumber Varchar(10) primary key not null,
Route varchar(250) not null,
Capacity int not null,
NoOfSeatsAvailable int not null,
NoOfSeatsReserved int not null,
VehicleType varchar(10) not null,
SupervisorID int ,
foreign key Vehicle(SupervisorID) references BusSupervisor(SupervisorID)
);

create table Passenger(
Email varchar(45) primary key not null,
PhoneNumber varchar(20) unique not null,
Street varchar(20) not null,
Area varchar(20) not null,
FirstName varchar(15) not null,
MiddleName varchar(15) not null,
LastName varchar(15) not null,
Gender varchar(6) ,
SupervisorID int not null ,
PlateNumber varchar(10) not null,
foreign key (SupervisorID) references BusSupervisor(SupervisorID),
foreign key (PlateNumber) references Vehicle(PlateNumber)
);

create table Student(
Email varchar(45) primary key not null,
Faculty varchar(45) not null,
StudentID int unique not null,
SupervisorID int,
foreign key Student(SupervisorID) references BusSupervisor(SupervisorID),
foreign key Student(Email) references Passenger(Email)
);

create table Administrator(
Email varchar(45) primary key not null,
AdministratorRank varchar(45) not null,
foreign key Administrator(Email) references Passenger(Email)
);

create table Staff(
Email varchar(45) primary key not null,
StaffID int,
Position varchar(45) not null,
foreign key Staff(Email) references Passenger(Email)
);

create table Visitor(
Email varchar(45) primary key not null,
VisitorID int not null,
foreign key Visitor(Email) references Passenger(Email)
);

create table BusTransaction(
TransactionID int primary key not null,
TransactionName varchar(45),
TransactionDate date not null,
BankName varchar(20) not null,
Email varchar(45) unique key not null,
foreign key BusTransaction(Email) references Passenger(Email)
);

create table Driver(
DriverID int primary key not null,
DriverSalary int not null,
DriverPhoneNumber varchar(20) unique not null,
DriverEmail varchar(45)unique not null,
DriverArea varchar(20) not null,
DriverStreet varchar(20) not null,
DriverFirstName varchar(15) not null,
DriverLastName varchar(15) not null,
PlateNumber Varchar(10) unique not null ,
foreign key Driver(PlateNumber) references Vehicle(PlateNumber)
);

create table Ticket(
TicketID int primary key not null,
QRCode int unique not null,
TicketDate date not null,
OneWayOrTwoWays varchar(15) not null,
Price int not null, 
CollectionPoint varchar(20) not null,
DepartureTime time not null,
Daily int default null,
Weekly int default null,
Monthly int default null,
Email varchar(45) unique key not null,
PlateNumber Varchar(10) not null,
foreign key Ticket(Email) references Passenger(Email),
foreign key Ticket(PlateNumber) references Vehicle(PlateNumber)
);

create table DaysOfComing(
Days varchar(10) not null,
TicketID int not null,
foreign key DaysOfComing(TicketID) references Ticket(TicketID)
);

insert into TransportsAdmin values(20100, "01123689321" ,"Yamen@AIU.com","Yamen","Ghonem");
insert into TransportsAdmin values(20101, "01223689421" ,"Farida@AIU.com","Farida","Mohamed");
insert into TransportsAdmin values(20102, "01523689521" ,"Mariam@AIU.com","Mariam","Anwer");
insert into TransportsAdmin values(20103, "01023689621" ,"Mohamed@AIU.com","Mohamed","Abdslam");
insert into TransportsAdmin values(20104, "01003689721" ,"Youssef@AIU.com","Youssef","Ahmed");
insert into TransportsAdmin values(20105, "01553689821","Donia@AIU.com","Donia","Aymen");

Select * from TransportsAdmin;

insert into BusSupervisor values(30100,"Mohammed@AIU.com", "01003456123","Mohammed","Osama","Sidi bishr","El montazah",6000,"Sidi bishr",20100, '2022-02-22');
insert into BusSupervisor values(30101,"Khaled@AIU.com", "01013456122","Khaled","Ehab","Abu qir","Elmontazah",6000,"Abu qir",20101, '2021-12-23');
insert into BusSupervisor values(30102,"Noor@AIU.com", "01023456121","Noor","Hossam","Smouha","Mostafa Kaml",6000,"Smouha",20102, '2022-04-19');
insert into BusSupervisor values(30103,"Sherif@AIU.com", "01033456124" ,"Sherif","sameh","Smouha","Sidi bishr",6000,"Smouha",20103, '2021-05-16');
insert into BusSupervisor values(30104,"Rana@AIU.com", "01073456125","Rana","Ahmed","Nasr city","Mostafa el nahaas",6000,"Ramsis",20104, '2022-01-01');
insert into BusSupervisor values(30105,"Nahed@AIU.com","01083456126","Nahed","Ismail","Maadi","elnasr",6000,"Abd elmunim riad",20105, '2021-09-12');

select * from BusSupervisor;

Insert into Vehicle(PlateNumber,Route,Capacity, NoOfSeatsAvailable, NoOfSeatsReserved, VehicleType, SupervisorID )
Values (123,'somoha',40, 6,34, 'Bus',30100);
Insert into Vehicle(PlateNumber,Route,Capacity, NoOfSeatsAvailable, NoOfSeatsReserved, VehicleType, SupervisorID )
Values (456,'borg al arab' ,20,6,14, 'Mini-Bus',30101);
 Insert into Vehicle(PlateNumber,Route,Capacity, NoOfSeatsAvailable, NoOfSeatsReserved, VehicleType, SupervisorID )
Values(789, 'el manshya',40,5,35, 'Bus' ,30102);
Insert into Vehicle(PlateNumber,Route,Capacity, NoOfSeatsAvailable, NoOfSeatsReserved, VehicleType, SupervisorID )
Values(101,'kafr abdo',40,0,40,'Bus',30103);
Insert into Vehicle(PlateNumber,Route,Capacity, NoOfSeatsAvailable, NoOfSeatsReserved, VehicleType, SupervisorID )
Values(112,'elmarg',20,2,18,'MiniBus',30104);
Insert into Vehicle(PlateNumber,Route,Capacity, NoOfSeatsAvailable, NoOfSeatsReserved, VehicleType, SupervisorID )
Values(131,' madenet nasr',40,7,33,'Bus' ,30105);

select * from vehicle;

insert into Passenger values("Bardess@Aiu.com", "01124680121","Mostafa Kamal","Smouha","Bardess","Khaled","Mohamed","Female",30100,456);
insert into Passenger values("Shaden@Aiu.com","01134680122","Ahmed fathy","Gleem","Shaden","Hazem","Mohamed","Female",30101,789);
insert into Passenger values("Esraa@Aiu.com","01144680123","Dr taymour","El mokattam","Esraa","Wael","Wagih","Female",30102,123);
insert into Passenger values("Rowan@Aiu.com","01154680124","Mahmoud Amer","Haram","Rowan","Badr","Saleh","Female",30103,123);
insert into Passenger values("Malak@Aiu.com","01164682125","Mostafa Kaml","Borg el arab","Malak","Amr","El sayed","female",30104,789);
insert into Passenger values("Nada@Aiu.com", "01184680120","Mostafa Kaml","Smouha","Nada","Ahmed","Mohamed","Female",30105,456);
insert into Passenger values("Hany@Aiu.com","01194686126","Gamal abd elnasser","Victoria","Hany","Abdein","Mohamed","male",30101,456);
insert into Passenger values("Nadia@Aiu.com","01152680127","Kafr abdou","Roushdy","Nadia","Mohamed","Khaled","Female",30103,789);
insert into Passenger values("Ahmed@Aiu.com","01294688128","Teseen","5th settlement","Ahmed","Samir","Mohamed","male",30103,123);
insert into Passenger values("Ashraf@Aiu.com","01150680129","Korbba","Masr al jadidah","Ashraf","Hassan","Tarek","male",30101,123);

select * from Passenger; 

insert into Student values ("Shaden@Aiu.com", "Computer Science & Engineering", 20100253, 30100);
insert into Student values ("Esraa@Aiu.com", "Pharmacy", 20100384, 30101);
insert into Student values ("Rowan@Aiu.com", "Dentistry", 20100239, 30103);
insert into Student values("Malak@Aiu.com", "Business" , 20100258, 30104);

select * from Student;

insert into Administrator values ("Hany@Aiu.com", "Manager");
insert into Administrator values ("Ashraf@Aiu.com", "Program Manager");

select * from Administrator;

insert into Staff values("Bardess@Aiu.com", 40100100, "Teacher Assistant" );
insert into Staff values("Nadia@Aiu.com", 40100101, "Student Affairs Employee" );

select * from Staff;

insert into Visitor values("Nada@Aiu.com",50100101);
insert into Visitor values("Ahmed@Aiu.com",50100102);

select * from Visitor;

Insert into BusTransaction (TransactionID,TransactionName,TransactionDate,BankName, Email)
Values (1348931123,'bustransaction1' ,'2022-05-15' ,'elahly bank', 'Rowan@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName, Email)
Values (1432562233, 'bustransaction2','2022-02-17', 'elqahera bank','Shaden@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName,Email)
Values(1432563245,'bustransaction3','2021-09-22','elahly bank', 'Malak@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName,Email)
Values(1432564123,'bustransaction4','2022-05-16','QNB Bank','Esraa@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName,Email)
Values(1432565456,'bustransaction5','2022-05-20','elahly bank', 'Nada@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName, Email)
Values(1432566000,'bustransaction6','2021-01-20','elahly bank', 'Hany@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName, Email)
Values(1432567643,'bustransaction7','2022-01-29','elahly bank', 'Ahmed@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName, Email)
Values(1432568439,'bustransaction8','2021-01-23','elahly bank', 'Nadia@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName, Email)
Values(1432569938,'bustransaction9','2022-03-13','elahly bank', 'Ashraf@Aiu.com');
Insert into BusTransaction(TransactionID,TransactionName,TransactionDate,BankName, Email)
Values(1432560397,'bustransaction10','2021-04-14','elahly bank', 'Bardess@Aiu.com');

select * from BusTransaction;

Insert into Driver(DriverID,DriverSalary, DriverPhoneNumber, DriverEmail, DriverArea , DriverStreet , DriverFirstName, DriverLastName, PlateNumber )
Values (23549,3000, "01245656768", 'Driver1@gmail.com','smoha','mustafa kamel', 'mohammed', 'ali',123);
Insert into Driver(DriverID,DriverSalary, DriverPhoneNumber, DriverEmail, DriverArea , DriverStreet , DriverFirstName, DriverLastName, PlateNumber )
Values (23550,3000, "01067583542", 'Driver2@gmail.com','sedy jaber','mosheer','osama' , 'gamal',456);
Insert into Driver(DriverID,DriverSalary, DriverPhoneNumber, DriverEmail, DriverArea , DriverStreet , DriverFirstName, DriverLastName, PlateNumber )
Values (23551,3000, "012568787496" , 'Driver3@gmail.com' , 'gleem', 'gleem street', 'selim','ahmed' ,789);
Insert into Driver(DriverID,DriverSalary, DriverPhoneNumber, DriverEmail, DriverArea , DriverStreet , DriverFirstName, DriverLastName, PlateNumber )
Values (23552,3000, "01578659439", 'Driver4@gmail.com' ,'elmontaza','jamela abohred' ,'momen', 'ali' ,101);
Insert into Driver(DriverID,DriverSalary, DriverPhoneNumber, DriverEmail, DriverArea , DriverStreet , DriverFirstName, DriverLastName, PlateNumber )
Values (23553,3000, "01224578946 ",'Driver5@gmail.com' ,'elmanshya' ,'salah salem','ahmed' ,'ali' ,112);
Insert into Driver(DriverID,DriverSalary, DriverPhoneNumber, DriverEmail, DriverArea , DriverStreet , DriverFirstName, DriverLastName, PlateNumber )
Values (23554,3500, "010078645442", 'Driver6@gmail.com','elmarg,shobra','maidan shobra' ,'salah', 'abdallah' ,131);

select * from Driver;

insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456784,2022001,'2022-05-15','Twoways',300,'Cairo-Alamein', '12:00',null,1,null,'Rowan@Aiu.com',123);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456781,2022002,'2021-04-14','Oneway',75,'Alexandria','8:00',1,null,null,'Bardess@Aiu.com',456);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456782,2022003,'2022-02-17','Twoways',3000,'Alalmein-Alexandria','3:00',null,null,1,'Shaden@Aiu.com',789);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456785,2022004,'2021-09-22','Twoways',3000,'Alexandria-Alalmein','8:00',null,null,1,'Malak@Aiu.com',789);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456783,2022005,'2022-05-16','Twoways',300,'Alalmein-Cairo','3:00',null,1,null,'Esraa@Aiu.com',123);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456786,2022006,'2022-05-20','Oneway',75,'Alalmein','3:00',1,null,null,'Nada@Aiu.com',456);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456787,2022007,'2021-01-20','Oneway',75,'Alalmein','3:00',1,null,null,'Hany@Aiu.com',456);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456788,2022008,'2022-01-29','Twoways',300,'Cairo-Alamein','12:00',null,1,null,'Ahmed@Aiu.com',123);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456789,2022009,'2021-01-23','Twoways',3000,'Alalmein-Alexandria','3:00',null,null,1,'Nadia@Aiu.com',789);
insert into Ticket(TicketID, QRCode, TicketDate, OnewayorTwoways,Price,CollectionPoint, DepartureTime, Daily, Weekly, Monthly, Email, PlateNumber)
values(123456780,2022000,'2022-03-13','Twoways',300,'Alalmein-Cairo','3:00',null,1,null,'Ashraf@Aiu.com',123);

select * from Ticket;

insert into DaysOfComing(Days, TicketID) values('Sunday',123456781);
insert into DaysOfComing(Days, TicketID) values('Monday',123456781);
insert into DaysOfComing(Days, TicketID) values('Tuesday',123456781);
insert into DaysOfComing(Days, TicketID) values('Wednsday',123456781);
insert into DaysOfComing(Days, TicketID) values('Sunday',123456782);
insert into DaysOfComing(Days, TicketID) values('Monday',123456782);
insert into DaysOfComing(Days, TicketID) values('Tuesday',123456782);
insert into DaysOfComing(Days, TicketID) values('Monday',123456783);
insert into DaysOfComing(Days, TicketID) values('Thursday',123456783);
insert into DaysOfComing(Days, TicketID) values('Tuesday',123456784);
insert into DaysOfComing(Days, TicketID) values('Wednesday',123456785);
insert into DaysOfComing(Days, TicketID) values('Thursday',123456786);
insert into DaysOfComing(Days, TicketID) values('Sunday',123456786);
insert into DaysOfComing(Days, TicketID) values('Monday',123456787);
insert into DaysOfComing(Days, TicketID) values('Tuesday',123456787);
insert into DaysOfComing(Days, TicketID) values('Wednsday',123456787);
insert into DaysOfComing(Days, TicketID) values('Sunday',123456787);
insert into DaysOfComing(Days, TicketID) values('Monday',123456788);
insert into DaysOfComing(Days, TicketID) values('Tuesday',123456788);
insert into DaysOfComing(Days, TicketID) values('Monday',123456789);
insert into DaysOfComing(Days, TicketID) values('Thursday',123456789);
insert into DaysOfComing(Days, TicketID) values('Tuesday',123456789);
insert into DaysOfComing(Days, TicketID) values('Wednesday',123456780);
insert into DaysOfComing(Days, TicketID) values('Thursday',123456780);

 select * from DaysOfComing; 

#Q1)Show me the passengers travelling from Cairo to Al Alamein?
select p.FirstName,p.MiddleName, p.LastName,p.email, t.CollectionPoint
from Passenger as p
inner join Ticket as t
on p.email=t.email
where CollectionPoint = 'Cairo-Alamein';

#Q2)Show me the passengers travelling in the bus of plate number of 123?
select concat(p.FirstName, ' ' ,p.MiddleName, ' ' , p.LastName) as Name, v.PlateNumber
from Passenger as p
inner join Vehicle as v
on p.PlateNumber=v.PlateNumber
and p.PlateNumber =123;

#Q3)Show which bus supervisor is going to Somoha area?
select bs.SupervisorID,bs.SupervisorFirstName, bs.SupervisorLastName
from BusSupervisor as bs 
inner join Vehicle as v
on bs.SupervisorID=v.SuperVisorID
and v.Route='Somoha';

#Q4)Show me how many seats are availalbe in each vehicle descending?
select NoOfSeatsAvailable, PlateNumber
from Vehicle
Group by  PlateNumber
Order BY NoOfSeatsAvailable DESC;

#Q5)Show me the passengers who booked monthly tickets?
select p.FirstName,p.MiddleName, p.LastName,p.email
from Passenger as p
inner join Ticket as t
on p.email=t.email
where Monthly=1;

#Q6)Show me the driver of bus 456?
select DriverFirstName,DriverLastName 
From Driver
where PlateNumber=456; 

ALTER TABLE BusTransaction RENAME VehicleTransaction ;