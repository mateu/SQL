# Test Intersect in MySQL
select * 
  from Engagements Eng1, Engagements Eng2
 where Eng1.EntertainerID <> Eng2.EntertainerID
   and Eng1.CustomerID = 10001
   and Eng2.CustomerID = 10010
 ;

select *
  from Engagements Eng1, Engagements Eng2
 where Eng1.EntertainerID = 1001
   and Eng2.EntertainerID = 1002
   and Eng1.CustomerID = Eng2.CustomerID
   and Eng1.CustomerID = 10001
;
 
 select count(*) from Customers C;
 select * from Customers C;
 select EntertainerID, EntStageName from Entertainers;
 select count(*) from Engagements Eng;
 select distinct EntertainerID, CustomerID
   from Engagements 
  where CustomerID IN 10010;
   
select distinct E1.EntertainerID, E2.EntertainerID 
from Entertainers E1, Entertainers E2,
Engagements Eng1, Engagements Eng2,
Customers C1, Customers C2
where E1.EntertainerID <> E2.EntertainerID
and   E1.EntertainerID = Eng1.EntertainerID
and   E2.EntertainerID = Eng2.EntertainerID
and   Eng1.CustomerID = C1.CustomerID
and   Eng2.CustomerID = C2.CustomerID
and (select count(*) from Entertainers where C1.CustomerID = C2.CustomerID) > 1
;
  
select distinct CustomerID, EntertainerID 
from Engagements 
where EntertainerID 
IN (1003, 1004)
order by CustomerID; 