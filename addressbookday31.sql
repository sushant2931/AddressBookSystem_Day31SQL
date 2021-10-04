*********UC1*********

create database address_book_service; // created database address book service

show databases;  // check database is added or not


********UC2**********
 create table address_book ( firstName VARCHAR(20) NOT NULL,  // create table
    -> lastName VARCHAR(20) NOT NULL,                         // add attribute 
    -> address VARCHAR(150) NOT NULL,
    -> city VARCHAR(20) NOT NULL,
    -> state VARCHAR(20)NOT NULL,
    -> zip INT NOT NULL,
    -> phoneNumber INT NOT NULL,
    ->  email VARCHAR(100) NOT NULL);


 DESCRIBE address_book; 				// to see table along with attribute

********UC3*************
 insert into address_book (firstName,lastName,address,city,state,zip,phoneNumber,email) values   //insert values into table
    ->  ('sushant','lad','anglai','gurgaon','HR',421301,1234577890,'suantlad@gmail.com'),
    ->  ('prathmesh','tibile','vardhman','kalyan','MH',421203,1234567890,'pt@gmail.com'),
    ->  ('aniruddha','patil','vardhman','dombivli','MH',421223,1234567990,'aniruddha@gmail.com'),
    ->  ('rajkumar','bisure','satara','kalyan','MH',421201,1234567890,'raju@gmail.com');

 select * from address_book;           //to view table with values


*********UC4************

update address_book set zip = 532103 where firstName='sushant';  // edit contact using name

 select * from address_book;   // to check updated given changes

*******UC5***********

 delete from address_book where firstName='sushant';     // delete person contact using name

*********UC6*********

select * from address_book where city='kalyan' or state='MH';   // retrive person with state or city

*********UC7**********

select count(city) from address_book;    // count according to city

select count(state) from address_book;   // count according to state

*********UC8************
select * from address_book where city='kalyan' order by firstName;    //sorted name for given city


*****UC9********

alter table address_book add type Varchar(20) NOT NULL;    // alter table
select * from address_book;                                             // view
update address_book set type = 'Friend' where firstname = 'prathmesh';         // add type friend
update address_book set type = 'Family' where firstname = 'aniruddha';     // add type family 
select * from address_book;                                               // view

*********UC10**********

 select count(type) from address_book where type = 'friend';          // count by type

*************UC11***********

 insert into address_book (firstName,lastName,address,city,state,zip,phoneNumber,email,type) values   //insert values into table
    ->  ('shubham','nalawade','angan','murbad','MH',421401,1274577890,'ponam@gmail.com','friend'),
    ->  ('shubham','suryawamshi','sudharshan','newyork','US',400003,8834567890,'deepika@gmail.com','profession');

************UC12**************
CREATE TABLE contacts (
 -> contact_id int,
 ->firstname varchar(20),
 ->lastname varchar(20),
 ->email varchar(150),
 ->phoneNo int,
 ->PRIMARY KEY (contact_id)
);

CREATE TABLE relation (
  ->relation_id int,
  ->type varchar(20),
  ->PRIMARY KEY (relation_id)
);

CREATE TABLE address_book (
  ->contact_id int,
  ->relation_id int,
  ->FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
  ->FOREIGN KEY (relation_id) REFERENCES relation(relation_id)
);

CREATE TABLE address (
  ->city varchar(20),
  ->state varchar(20),
  ->zipcode int,
  ->country varchar(20)
);

***********UC13**********
select count(type)
    -> from address_book a,person_details p,relation_type r
    -> where a.contact_id = p.contact_id
    -> and a.relation_id = r.relation_id
    -> group by type;

select count(state)
    -> from address ,person_details p
    -> where p.person_id = a.person_id
    -> and state = "mh";