# mateu x hunter
# mxhunter
# November 21, 2009
# Assignment 3

# 1
select distinct  C1.CustomerID, Eng1.EntertainerID, Eng2.EntertainerID
  from Customers C1, Engagements Eng1, Engagements Eng2
 where Eng1.EntertainerID <> Eng2.EntertainerID
   and C1.CustomerID = Eng1.CustomerID 
   and Eng1.CustomerID = Eng2.CustomerID 
   and exists
   ( select * from Engagements Eng3, Engagements Eng4
     where Eng3.EntertainerID <> Eng4.EntertainerID
       and Eng3.EntertainerID = Eng1.EntertainerID
       and Eng4.EntertainerID = Eng2.EntertainerID
       and Eng3.CustomerID = Eng4.CustomerID
       and C1.CustomerID <> Eng3.CustomerID
   )
order by Eng1.EntertainerID, Eng2.EntertainerID
;

# 2
select A.CustomerID, B.CustomerID
from Customers A, Customers B
where A.CustomerID <> B.CustomerID
and not exists
(
  select * from Musical_Preferences MP
   where MP.CustomerID = A.CustomerID
     and MP.StyleID not in
  (
    select MP2.StyleID 
      from Musical_Preferences MP2
     where MP2.CustomerID = B.CustomerID
  )
)
and not exists
(
  select * from Musical_Preferences MP3
   where MP3.CustomerID = B.CustomerID
     and MP3.StyleID not in
  ( 
    select MP4.StyleID
      from Musical_Preferences MP4
     where MP4.CustomerID = A.CustomerID
  )
)
;

# 3
select C1.CustomerID, C2.CustomerID 
from Customers C1, Customers C2
where C1.CustomerID <> C2.CustomerID
and not exists 
(
select * from Musical_Preferences MP1
  join Musical_Preferences MP2
    on MP1.StyleID = MP2.StyleID
 where MP1.CustomerID = C1.CustomerID
   and MP2.CustomerID = C2.CustomerID
)
;

# 4
select A.AgentID, B.AgentID
from Agents A, Agents B
where A.AgentID <> B.AgentID
and exists
(
  select * from Engagements Eng, Customers C
  where Eng.AgentID = A.AgentID
    and Eng.CustomerID = C.CustomerID
    and C.CustState IN
  (
    select C2.CustState from Engagements Eng2, Customers C2
     where Eng2.AgentID = B.AgentID
       and Eng2.CustomerID = C2.CustomerID
  )
)
;

# 5
select Ent.EntStageName, Eng.ContractPrice 
from Entertainers Ent, Engagements Eng
where Ent.EntertainerID = Eng.EntertainerID
and Eng.ContractPrice = 
( select Eng2.ContractPrice 
    from Engagements Eng2 
   where Eng2.ContractPrice
  not in 
	( select Eng3.ContractPrice 
	   from Engagements Eng3, Engagements Eng4
	  where Eng3.ContractPrice < Eng4.ContractPrice
	)  
)
;

 
# 6
select M.MbrFirstName, MbrLastName, M.Gender
  from Members M
  join Entertainer_Members E_M
    on M.MemberID = E_M.MemberID
  join Engagements Eng
    on E_M.EntertainerID = Eng.EntertainerID
 where Eng.ContractPrice = 
 ( 
   select Eng2.ContractPrice 
   from Engagements Eng2
   where Eng2.ContractPrice NOT IN 
   (select Eng3.ContractPrice 
      from Engagements Eng3, Engagements Eng4
     where Eng3.ContractPrice < Eng4.ContractPrice)
 )
;





