--Q1
select menu_number , dish, food_comment, price from menu where menu_time like 'BREAK';

--Q2 For another time

--Q3
select * from Table_Booking where Booking_name is NULL;

--Q4
select count(*) as Quaverly_Visits from Table_Booking  where Booking_name like '%Quaverly%' and book_date > ADD_MONTHS(sysdate,-6);

--Q5
select Booking_name, count(*) from Table_Booking group by Booking_name having count(*) > 2 and Booking_name is not null;

--Q6
select * from menu where menu_time like 'EBIRD' union select * from menu where menu_time like 'DNNER';

--Q7
select dish from menu where menu_time like 'EBIRD' intersect select dish from menu where menu_time like 'DNNER';

--Q8
select dish from menu where menu_time like 'DNNER' minus select dish from menu where menu_time like 'EBIRD';

--Q9
select a.TableNo, a.menu_number, b.menu_time from  mOrder a, menu b where b.menu_time like 'EBIRD';