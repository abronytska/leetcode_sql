/* Write your PL/SQL query statement below */
update salary
   set sex = decode(sex, 'm', 'f', 'f', 'm');