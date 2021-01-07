/* Write your PL/SQL query statement below */
select p.firstname as "FirstName", p.lastname as "LastName", 
       a.city as "City", a.state as "State"
  from Person p
  left join Address a
    on p.PersonId = a.PersonId;