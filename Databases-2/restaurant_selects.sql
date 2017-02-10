/*  Date: 30/9/2015
    
    Authour: Alex Kiernan
    
    Content: Databases 2 lab 3 pratice quiz 
*/

/* Question 1 - Select: Display breakfast menu for client */
SELECT MENU_NUMBER, DISH, FOOD_COMMENT, PRICE
FROM MENU 
WHERE MENU_TIME LIKE 'BREAK';

/* Question 4 - Aggregation: Number of time Quaverly has booked in last 6 months */
SELECT COUNT(BOOK_DATE) AS QuaverlyLast6Months
FROM TABLE_BOOKING
WHERE MONTHS_BETWEEN(SYSDATE, BOOK_DATE) < 6
AND BOOKING_NAME = 'Quaverly';

/* Question 5 - Aggregation: Clients who booked more than twice */
SELECT BOOKING_NAME 
FROM TABLE_BOOKING
WHERE BOOKING_NAME IS NOT NULL
GROUP BY BOOKING_NAME
HAVING COUNT(BOOKING_NAME) > 2;

/* Question 6 - Set: Dishes that appear on Early Bird or Dinner menu */
SELECT DISH, MENU_TIME 
FROM MENU
WHERE MENU_TIME LIKE 'EBIRD'
UNION
SELECT DISH, MENU_TIME
FROM MENU 
WHERE MENU_TIME LIKE 'DNNER';

/* Question 7 - Set: Dishes that appear on Early Bird and Dinner menu */
SELECT DISH, MENU_TIME 
FROM MENU
WHERE MENU_TIME LIKE 'EBIRD'
INTERSECT
SELECT DISH, MENU_TIME
FROM MENU 
WHERE MENU_TIME LIKE 'DNNER';

/* Question 8 - Set: Dishes that appear on Early Bird but not Dinner menu */
SELECT DISH, MENU_TIME 
FROM MENU
WHERE MENU_TIME LIKE 'EBIRD'
MINUS
SELECT DISH, MENU_TIME
FROM MENU 
WHERE MENU_TIME LIKE 'DNNER';

/* Question 9 - Join: Location of table that ordered dish from early bird */
SELECT TLOCATION
FROM RTABLE
INNER JOIN MORDER
ON RTABLE.TABLENO = MORDER.TABLENO
INNER JOIN MENU
ON MORDER.MENU_NUMBER = MENU.MENU_NUMBER
WHERE MENU.MENU_TIME LIKE 'EBIRD';

/* Question 10 - Join: Details of all tables that have never been booked */
SELECT RTABLE.TABLENO, RTABLE.TLOCATION, RTABLE.CAPACITY
FROM RTABLE
LEFT JOIN TABLE_BOOKING
ON RTABLE.TABLENO = TABLE_BOOKING.TABLENO
WHERE TABLE_BOOKING.TABLENO IS NULL;

/* Question 11 - Join: Details of all tables that have been booked */
SELECT RTABLE.TABLENO, RTABLE.TLOCATION, RTABLE.CAPACITY
FROM RTABLE
LEFT JOIN TABLE_BOOKING
ON RTABLE.TABLENO = TABLE_BOOKING.TABLENO
WHERE TABLE_BOOKING.TABLENO IS NOT NULL;

/* Question 12 - Subquery: Details of all tables that have never been booked */
SELECT *
FROM RTABLE
WHERE TABLENO NOT IN 
  ( SELECT TABLENO
    FROM TABLE_BOOKING);

/* Question 13 - Subquery: Details of all tables that have been booked */
SELECT *
FROM RTABLE
WHERE TABLENO IN 
  ( SELECT TABLENO
    FROM TABLE_BOOKING);
    
/* Question 14 - Subquery: Name and profit made by each dish < average profit */
SELECT DISH, (PRICE - COST_PRICE) AS PROFIT
FROM MENU
WHERE PROFIT > ALL
  ( SELECT AVG(PROFIT) 
    FROM MENU);