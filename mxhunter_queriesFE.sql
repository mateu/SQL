# mateu x hunter
# mxhunter
# December 18, 2009
# Final Exame

#1
-- NOTE: This query returns duplicate rows when ordering is dis-regarded
-- In fact unordered triplets are returned 6 times each because one 
-- can permute (order) 3 objects in 3! = 6 ways. 
select DISTINCT MP1.CustomerID, C1.CustFirstName, C1.CustLastName, 
                MP2.CustomerID, C2.CustFirstName, C2.CustLastName, 
                MP3.CustomerID, C3.CustFirstName, C3.CustLastName
  from Musical_Preferences MP1
  join Customers C1
    on MP1.CustomerID = C1.CustomerID
  join Musical_Preferences MP2
    on MP1.StyleID = MP2.StyleID
   and MP1.CustomerID <> MP2.CustomerID
  join Customers C2
    on MP2.CustomerID = C2.CustomerID
  join Musical_Preferences MP3
    on MP2.StyleID = MP3.StyleID
   and MP2.CustomerID <> MP3.CustomerID
   and MP1.CustomerID <> MP3.CustomerID
  join Customers C3
    on MP3.CustomerID = C3.CustomerID
 ;
 
 #2
 select E.EntStageName, M.MbrFirstName, M.MbrLastName
 from Entertainers E
 left join Members M
   on E.EntPhoneNumber = M.MbrPhoneNumber
 order by E.EntStageName

 #3
 -- Note this implementation is MySQL specific
 -- If I were using another database that supported the SQL 99 standard of 'SIMILAR TO'
 -- then I take that approach.
 select E.EntSSN
 from Entertainers E
 where E.EntSSN REGEXP '[[:digit:]]{3}-[[:digit:]]{1}8-0[[:digit:]]{3}'
 ;
 
 #4 
 select M1.Gender, count(*) as gender_count
   from Members M1
  where M1.Gender = 'M'
 UNION
 select M2.Gender, count(*) as gender_count
   from Members M2
  where M2.Gender = 'F'
;


#5 
select Eng.EntertainerID, Eng.StartTime, count(*)
from Engagements Eng
group by Eng.StartTime, Eng.EntertainerID
order by Eng.EntertainerID, Eng.StartTime
;
