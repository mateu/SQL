# mateu x hunter
# mxhunter
# December 18, 2009
# Final Exame

select MP1.CustomerID from Musical_Preferences MP1
where EXISTS
( 
  select * from Musical_Preferences MP2 
  where MP1.CustomerID <> MP2.CustomerID
    and MP1.StyleID = MP2.StyleID
    and EXISTS
  (
    select * from Musical_Preferences MP3
    where MP1.CustomerID <> MP3.CustomerID
      and MP2.CustomerID <> MP3.CustomerID
      and MP2.StyleID = MP3.StyleID
  )
)
;

# 1
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
 
 # 2
 select E.EntStageName, E.EntPhoneNumber
 from Entertainers E
 join Members M
   on E.EntPhoneNumber = M.MbrPhoneNumber