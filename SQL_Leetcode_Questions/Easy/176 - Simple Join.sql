create database practise_set;
use practise_set;
show tables;
describe address;
describe person;
select p.FirstName, p.LastName,a.city,a.state from person p join address a using (PersonId);
