# mateu x hunter
# mxhunter@indiana
# November 12, 2009
# Assignment dos

# 1
select distinct StyleName from Customers C
join Musical_Preferences MP
  on C.CustomerID = MP.CustomerID
join Musical_Styles MS
  on MP.StyleID=MS.StyleID
;

# 2
select distinct EntStageName, EntStreetAddress, EntCity, EntState, EntZipCode, EntPhoneNumber, EntWebPage, EntEmailAddress
  from Entertainers Ent
  join Engagements Eng
    on Ent.EntertainerID = Eng.EntertainerID
 where ContractPrice < 500;
 
# 3
 select distinct EntStageName, EntStreetAddress, EntCity, EntState, EntZipCode, EntPhoneNumber, EntWebPage, EntEmailAddress
  from Entertainers Ent
  join Engagements Eng
    on Ent.EntertainerID = Eng.EntertainerID
 where ( ContractPrice / (hour(Stoptime - StartTime) + (minute(StopTime - StartTime)/60)) ) < 100
;
 
 # 4
 select AgtFirstName, AgtLastName, EntStageName
 from Engagements Eng
 join Agents A
   on A.AgentID = Eng.AgentId
 join Entertainers Ent
   on Eng.EntertainerID = Ent.EntertainerID
 join Entertainer_Styles ES
   on Ent.EntertainerID = ES.EntertainerID
 join Musical_Styles MS 
   on ES.StyleID = MS.StyleID
 where StyleName = 'Karoake'
 ;
 
 # 5
 -- incomplete because i'm brain farting on musical interest restriction.
 select C1.CustFirstName, C1.CustLastName, C2.CustFirstName, C2.CustLastName
  from Customers C1
  join Customers C2
  on C1.CustCity = C2.CustCity
 and C1.CustState = C2.CustState  
  join Musical_Preferences MP1
    on C1.CustomerID = MP1.CustomerID
;
  
 
 # 6
 select EntStageName
 from Entertainers Ent
 join Entertainer_Members EM
   on Ent.EntertainerID = EM.EntertainerID
 join Members M
   on EM.MemberID = M.MemberID
where Gender = 'F'
;

# 7
select C.CustFirstName, C.CustLastName, Ent.EntStageName
from Customers C
join Engagements Eng
  on C.CustomerID = Eng.CustomerID
join Entertainers Ent
  on Eng.EntertainerID = Ent.EntertainerID
where C.CustCity = Ent.EntCity
order by C.CustLastName, C.CustFirstName
;

# 8
select C.CustFirstName, C.CustLastName 
  from Customers C
 where C.CustomerID In ( 
select Distinct Eng1.CustomerID
  from Engagements Eng1,
       Engagements Eng2
 where Eng1.CustomerID = Eng2.CustomerID
   and Eng1.EntertainerID <> Eng2.EntertainerID
)
;


# 9
select Ent.EntStageName
from Entertainers Ent
join Engagements Eng
  on Ent.EntertainerID = Eng.EntertainerID
join Customers C
  on Eng.CustomerID = C.CustomerID
where C.CustState <> Ent.EntState
;

# 10
select Ent.EntStageName
from Entertainers Ent
join Entertainer_Styles ES
  on Ent.EntertainerID = ES.EntertainerID
join Musical_Styles MS
  on ES.StyleID = MS.StyleID
where MS.StyleName = 'Modern Rock'
  and Ent.EntState in ('IN', 'KY', 'IL', 'OH')
;
