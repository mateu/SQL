# mateu x hunter
# mxhunter
# December 2, 2009
# Assignment 4

# 1
select distinct M.MbrFirstName, MbrLastName, M.Gender
  from Members M
  join Entertainer_Members E_M
    on M.MemberID = E_M.MemberID
  join Engagements Eng
    on E_M.EntertainerID = Eng.EntertainerID
 where Eng.ContractPrice = 
 ( select max(Eng2.ContractPrice) from Engagements Eng2)
   order by M.Gender
 ;
 
# 2
# Adding average per engagement sheerly for the enjoyment of it.
select C.CustomerID, count(*) as "number of engagments", sum(E.ContractPrice) "total amount spent",
sum(E.ContractPrice) / count(*) as "average spent per engagement"
  from Customers C, Engagements E
 where C.CustomerID = E.CustomerID
 group by C.CustomerID
 order by  sum(E.ContractPrice) / count(*) DESC
 ;
 
 # 3
 select max(average_prices_per_start_time.average_contract_price), average_prices_per_start_time.StartTime
 from (
 select avg(E.ContractPrice) as average_contract_price, E.StartTime
 from Engagements E
 group by E.StartTime
 -- order by average_contract_price DESC
 ) average_prices_per_start_time
 ;
 
 # 4
 select max(preference_popularity), P.StyleID 
 from 
 (
 select count(*) as preference_popularity, MP.StyleID
 from Musical_Preferences MP
 group by MP.StyleID
 order by count(*) DESC
 ) P
 ;
 
 # 5
 select max(avg_price_per_city.average_price), avg_price_per_city.CustCity, avg_price_per_city.CustState
 from
 (
 select avg(E.ContractPrice) average_price, C.CustCity, C.CustState
 from  Engagements E, Customers C
 where E.CustomerID = C.CustomerID
 group by C.CustCity, C.CustState
 order by average_price DESC
 ) avg_price_per_city
 ;
 
# 6
select max(nbr_ents.number_of_entertainers), nbr_ents.AgentID
from
(
select count(*) as number_of_entertainers, E.AgentID
from Engagements E
group by E.AgentID
order by number_of_entertainers DESC
) nbr_ents
;
 
# 7
select max(ME.member_earnings) max_earnings, ME.MemberID
from 
(
select sum(P.price_per_member) as member_earnings, EM.MemberID
  from Entertainer_Members EM
  join 
(
  select Eng.ContractPrice, Eng.EngagementNumber, Eng.EntertainerID, count(*), Eng.ContractPrice / count(*) as price_per_member
    from Engagements Eng
    join Entertainer_Members EM
   using(EntertainerID)
group by Eng.EntertainerID, Eng.EngagementNumber
) P
on EM.EntertainerID = P.EntertainerID
group by EM.MemberID
order by member_earnings DESC
) ME 
;