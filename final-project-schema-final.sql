DROP TABLE APP_USER CASCADE CONSTRAINTS;
DROP TABLE APP_CAR CASCADE CONSTRAINTS;
DROP TABLE APP_TRIP_INFO CASCADE CONSTRAINTS;
DROP TABLE TRIP_HISTORY CASCADE CONSTRAINTS;

CREATE TABLE APP_USER (
  UserID  number(10) not null, 
  UserName varchar2(50) not null,
  UserAddress varchar2(50) not null,
  UserPhone   varchar2(15) not null,
  UserEmail   varchar2(50) not null,
  primary key (UserID)
); 

CREATE TABLE APP_CAR (
  CarManufacturer  varchar2(50) not null,
  CarModel varchar2(50) not null,
  NumSeats number(10) not null,
  CarYear   number(10),
  LicenseNo   varchar2(50) not null,
  OwnerID   number(10) not null, 
  primary key (LicenseNo),
  foreign key (OwnerID) references APP_USER(UserID)
); 


CREATE TABLE APP_TRIP_INFO (
  Destination  varchar2(100) not null,
  NumRiders number(2) not null check (NumRiders < 12),
  DepartureTime varchar2(50) not null,
  TripID   number(10) not null,
  RiderID   number(10) not null,
  CarLicense   varchar2(50) not null,
  
  primary key (TripID),
  foreign key (RiderID) references APP_USER(UserID),
  foreign key (CarLicense) references  APP_CAR(LicenseNo)
); 

CREATE TABLE TRIP_HISTORY (
  Destination  varchar2(100) not null,
  NumRiders number(2) not null check (NumRiders < 12),
  DepartureTime varchar2(50) not null,  
  TripHistoryID   number(10) not null,
  TripInfoID   number(10) not null,
  
  primary key (TripHistoryID),
  foreign key (TripInfoID) references APP_TRIP_INFO(TripID)
); 



