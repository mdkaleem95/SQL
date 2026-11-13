#QUERIES

1.	Display snum,sname,city and comm of all salespeople.

    SELECT snum, sname, city, comm 
	from salespeople;

2.	Display all snum without duplicates from all orders.

    SELECT Distinct(snum)
	from orders;

3.	Display names and commissions of all salespeople in london.

    SELECT name, Commission 
	from salespeople 
	where city = "london";

4.	All customers with rating of 100.

    SELECT * 
	from cust 
	where rating = 100;

5.	Produce orderno, amount and date form all rows in the order table.

    SELECT orderno, amount, date 
	from orders;

6.	All customers in San Jose, who have rating more than 200.

    SELECT *  
	from customers 
	where city = "San Jose" and rating = 200;

7.	All customers who were either located in San Jose or had a rating above 200.

    SELECT *  
	from customers 
	here city = "San Jose" or rating = 200;

8.	All orders for more than $1000.

    SELECT * 
	from orders 
	where amt > 1000;

9.	Names and citires of all salespeople in london with commission above 0.10.

    SELECT name, city 
	from salespeople 
	where city = "london" and commission > 0.10;

10.	All customers excluding those with rating <= 100 unless they are located in Rome.

    SELECT * 
	from customers 
	where rating > 100 or located = "Rome";

11.	All salespeople either in Barcelona or in london.

    SELECT * 
	from salespeople 
	where city in ("Barcelona", "london");

12.	All salespeople with commission between 0.10 and 0.12. (Boundary values should be excluded)

    SELECT * 
	from salespeople 
	where commision > 0.10 and commision <0.12;

13.	All customers with NULL values in city column.

    SELECT * 
	from customers 
	where city is Null;

14.	All orders taken on Oct 3Rd   and Oct 4th  1994.

    SELECT * 
	from orders 
	where date = '1994-10-03' and date = '1994-10-05';

15.	All customers serviced by peel or Motika.

    SELECT c.*,
    from customer c
    Inner Join salespeople s
    On c.sum = s.sum
    where s.name in ("peel", motika)

16.	All customers whose names begin with a letter from A to B.

    SELECT * 
	from customer 
	where cname like '[A-B]%';

17.	All orders except those with 0 or NULL value in amt field.

    SELECT * 
	from orders 
	where amt <> 0 And amt Is not Null;

18.	Count the number of salespeople currently listing orders in the order table.

    SELECT count(distinct snum) As total_salespeople 
	from orders;

19.	Largest order taken by each salesperson, datewise.

    SELECT snum, max(sname) as largest_order, date 
	from orders 
	order by date asc;

20.	Largest order taken by each salesperson with order value more than $3000.

    SELECT SNUM, MAX(AMT) AS Largest_Order
    FROM ORDERS
    WHERE AMT > 3000
    GROUP BY SNUM;

21.	Which day had the hightest total amount ordered.
	
	SELECT TOP 1
    ODATE,
    SUM(AMT) AS Total_Amount
	FROM ORDERS
	GROUP BY ODATE
	ORDER BY SUM(AMT) DESC;

22.	Count all orders for Oct 3rd.
	
	SELECT COUNT(*) AS Total_Orders
	FROM ORDERS
	WHERE ODATE = '1994-10-03';

23.	Count the number of different non NULL city values in customers table.

	SELECT COUNT(DISTINCT CITY) AS Total_Cities
	FROM CUST;

24.	Select each customer’s smallest order.

	SELECT CNUM, MIN(AMT) AS Smallest_Order
	FROM ORDERS
	GROUP BY CNUM;

25.	First customer in alphabetical order whose name begins with G.

	SELECT TOP 1 CNUM, CNAME, CITY, RATING, SNUM
	FROM CUST
	WHERE CNAME LIKE 'G%'
	ORDER BY CNAME ASC;

26.	Get the output like “ For dd/mm/yy there are ___ orders.

	SELECT 'For ' + FORMAT(ODATE, 'dd/MM/yy') + ' there are ' + CAST(COUNT(*) AS VARCHAR(10)) + ' orders.' AS Order_Summary
	FROM ORDERS
	GROUP BY ODATE
	ORDER BY ODATE;

27.	Assume that each salesperson has a 12% commission. Produce order no., salesperson no., and amount of salesperson’s commission for that order.

	SELECT ONUM, SNUM, AMT, AMT * 0.12 AS Commission_Amount
	FROM ORDERS;

28.	Find highest rating in each city. Put the output in this form. For the city (city), the highest rating is : (rating).

	SELECT 'For the city ' + CITY + ', the highest rating is: ' + CAST(MAX(RATING) AS VARCHAR(10)) AS Rating_Summary
	FROM CUST
	WHERE CITY IS NOT NULL
	GROUP BY CITY;

29.	Display the totals of orders for each day and place the results in descending order.

	SELECT ODATE, SUM(AMT) AS Total_Amount
	FROM ORDERS
	GROUP BY ODATE
	ORDER BY Total_Amount DESC;

30.	All combinations of salespeople and customers who shared a city. (ie same city).

	SELECT  S.SNUM,  S.SNAME,  S.CITY,  C.CNUM,  C.CNAME
	FROM SALESPEOPLE S
	INNER JOIN CUST C
    ON S.CITY = C.CITY;

31.	Name of all customers matched with the salespeople serving them.

	SELECT C.CNAME AS Customer_Name, S.SNAME AS Salesperson_Name
	FROM CUST C
	INNER JOIN SALESPEOPLE S
    ON C.SNUM = S.SNUM;

32.	List each order number followed by the name of the customer who made the order.

	SELECT O.ONUM, C.CNAME
	FROM ORDERS O
	INNER JOIN CUST C
    ON O.CNUM = C.CNUM;

33.	Names of salesperson and customer for each order after the order number.

	SELECT O.ONUM, S.SNAME AS Salesperson_Name,C.CNAME AS Customer_Name
	FROM ORDERS O
	INNER JOIN SALESPEOPLE S
    ON O.SNUM = S.SNUM
	INNER JOIN CUST C
    ON O.CNUM = C.CNUM;

34.	Produce all customer serviced by salespeople with a commission above 12%.

	SELECT C.CNUM, C.CNAME, C.CITY, S.SNAME, S.COMM
	FROM CUST C
	INNER JOIN SALESPEOPLE S
    ON C.SNUM = S.SNUM
	WHERE S.COMM > 0.12;

35.	Calculate the amount of the salesperson’s commission on each order with a rating above 100.

	SELECT O.ONUM, C.CNAME, C.RATING, O.AMT, S.SNAME, O.AMT * S.COMM AS Commission_Amount
	FROM ORDERS O
	INNER JOIN CUST C
    ON O.CNUM = C.CNUM
	INNER JOIN SALESPEOPLE S
    ON O.SNUM = S.SNUM
	WHERE C.RATING > 100;

36.	Find all pairs of customers having the same rating.

	SELECT C1.CNAME AS Customer_1, C2.CNAME AS Customer_2, C1.RATING
	FROM CUST C1
	INNER JOIN CUST C2
    ON C1.RATING = C2.RATING
	WHERE C1.CNUM <> C2.CNUM;

37.	Find all pairs of customers having the same rating, each pair coming once only.

	SELECT C1.CNAME AS Customer_1, C2.CNAME AS Customer_2, C1.RATING
	FROM CUST C1
	INNER JOIN CUST C2
    ON C1.RATING = C2.RATING
	WHERE C1.CNUM < C2.CNUM;

38.	Policy is to assign three salesperson to each customers. Display all such combinations.

	SELECT C.CNAME AS Customer_Name, S.SNAME AS Salesperson_Name
	FROM CUST C
	CROSS JOIN SALESPEOPLE S;

39.	Display all customers located in cities where salesman serres has customer.

	SELECT *
	FROM CUST
	WHERE CITY IN (
    SELECT DISTINCT C.CITY
    FROM CUST C
    INNER JOIN SALESPEOPLE S
        ON C.SNUM = S.SNUM
    WHERE S.SNAME = 'Serres');

40.	Find all pairs of customers served by single salesperson.

	SELECT C1.CNAME AS Customer_1, C2.CNAME AS Customer_2, C1.SNUM AS Salesperson_Number
	FROM CUST C1
	INNER JOIN CUST C2
    ON C1.SNUM = C2.SNUM
	WHERE C1.CNUM < C2.CNUM;
	
41.	Produce all pairs of salespeople which are living in the same city. Exclude combinations of salespeople with themselves as well as duplicates with the order reversed.

	SELECT S1.SNAME AS Salesperson_1, S2.SNAME AS Salesperson_2, S1.CITY
	FROM SALESPEOPLE S1
	INNER JOIN SALESPEOPLE S2
    ON S1.CITY = S2.CITY
	WHERE S1.SNUM < S2.SNUM;
	
42.	Produce all pairs of orders by given customer, names that customers and eliminates duplicates.

	SELECT C.CNAME AS Customer_Name, O1.ONUM AS Order_1, O2.ONUM AS Order_2
	FROM ORDERS O1
	INNER JOIN ORDERS O2
    ON O1.CNUM = O2.CNUM
	INNER JOIN CUST C
    ON O1.CNUM = C.CNUM
	WHERE O1.ONUM < O2.ONUM;

43.	Produce names and cities of all customers with the same rating as Hoffman.

	SELECT CNAME, CITY, RATING
	FROM CUST
	WHERE RATING = (
    SELECT RATING
    FROM CUST
    WHERE CNAME = 'Hoffman');

44.	Extract all the orders of Motika.

	SELECT O.*
	FROM ORDERS O
	INNER JOIN SALESPEOPLE S
    ON O.SNUM = S.SNUM
	WHERE S.SNAME = 'Motika';

45.	All orders credited to the same salesperson who services Hoffman.

	SELECT *
	FROM ORDERS
	WHERE SNUM = (
    SELECT SNUM
    FROM CUST
    WHERE CNAME = 'Hoffman');

46.	All orders that are greater than the average for Oct 4.

	SELECT *
	FROM ORDERS
	WHERE AMT > (
    SELECT AVG(AMT)
    FROM ORDERS
    WHERE ODATE = '1994-10-04');

47.	Find average commission of salespeople in london.

	SELECT AVG(COMM) AS Average_Commission
	FROM SALESPEOPLE
	WHERE CITY = 'London';

48.	Find all orders attributed to salespeople servicing customers in london.

	SELECT *
	FROM ORDERS
	WHERE SNUM IN (
    SELECT DISTINCT SNUM
    FROM CUST
    WHERE CITY = 'London');

49.	Extract commissions of all salespeople servicing customers in London.

	SELECT S.SNUM, S.SNAME, S.COMM
	FROM SALESPEOPLE S
	WHERE S.SNUM IN (
    SELECT DISTINCT SNUM
    FROM CUST
    WHERE CITY = 'London');

50.	Find all customers whose cnum is 1000 above the snum of serres.

	SELECT *
	FROM CUST
	WHERE CNUM = (
    SELECT SNUM + 1000
    FROM SALESPEOPLE
    WHERE SNAME = 'Serres');

51.	Count the customers with rating  above San Jose’s average.

	SELECT COUNT(*) AS Total_Customers
	FROM CUST
	WHERE RATING > (
    SELECT AVG(RATING)
    FROM CUST
    WHERE CITY = 'San Jose');

52.	Obtain all orders for the customer named Cisnerous. (Assume you don’t know his customer no. (cnum)).

	SELECT *
	FROM ORDERS
	WHERE CNUM = (
    SELECT CNUM
    FROM CUST
    WHERE CNAME = 'Cisnerous');

53.	Produce the names and rating of all customers who have above average orders.

	SELECT CNAME, RATING
	FROM CUST
	WHERE CNUM IN (
    SELECT CNUM
    FROM ORDERS
    WHERE AMT > (
        SELECT AVG(AMT)
        FROM ORDERS ));

54.	Find total amount in orders for each salesperson for whom this total is greater than the amount of the largest order in the table.

	SELECT SNUM, SUM(AMT) AS Total_Amount
	FROM ORDERS
	GROUP BY SNUM
	HAVING SUM(AMT) > (
    SELECT MAX(AMT)
    FROM ORDERS);

55.	Find all customers with order on 3rd Oct.

	SELECT DISTINCT C.CNUM, C.CNAME
	FROM CUST C
	INNER JOIN ORDERS O
    ON C.CNUM = O.CNUM
	WHERE O.ODATE = '1994-10-03';

56.	Find names and numbers of all salesperson who have more than one customer.

	SELECT S.SNUM, S.SNAME
	FROM SALESPEOPLE S
	INNER JOIN CUST C
    ON S.SNUM = C.SNUM
	GROUP BY S.SNUM, S.SNAME
	HAVING COUNT(C.CNUM) > 1;

57.	Check if the correct salesperson was credited with each sale.

	SELECT O.ONUM, C.CNAME, O.SNUM AS Order_Salesperson, C.SNUM AS Assigned_Salesperson,
    CASE
        WHEN O.SNUM = C.SNUM THEN 'Correct'
        ELSE 'Incorrect'
    END AS Salesperson_Status
	FROM ORDERS O
	INNER JOIN CUST C
    ON O.CNUM = C.CNUM;

58.	Find all orders with above average amounts for their customers.

	SELECT *
	FROM ORDERS O
	WHERE AMT > (
    SELECT AVG(AMT)
    FROM ORDERS
    WHERE CNUM = O.CNUM);

59.	Find the sums of the amounts from order table grouped by date, eliminating all those dates where the sum was not at least 2000 above the maximum amount.

	SELECT ODATE, SUM(AMT) AS Total_Amount
	FROM ORDERS
	GROUP BY ODATE
	HAVING SUM(AMT) >= (
    SELECT MAX(AMT) + 2000
    FROM ORDERS);

60.	Find names and numbers of all customers with ratings equal to the maximum for their city.

	SELECT C1.CNUM, C1.CNAME, C1.CITY, C1.RATING
	FROM CUST C1
	WHERE C1.RATING = (
    SELECT MAX(C2.RATING)
    FROM CUST C2
    WHERE C2.CITY = C1.CITY);

61.	Find all salespeople who have customers in their cities who they don’t service. ( Both way using Join and Correlated subquery.)

	SELECT S.SNAME AS Salesperson_Name,  S.CITY, C.CNAME AS Customer_Name, C.SNUM AS Assigned_Salesperson
	FROM SALESPEOPLE S
	INNER JOIN CUST C
    ON S.CITY = C.CITY
	WHERE S.SNUM <> C.SNUM;

62.	Extract cnum,cname and city from customer table if and only if one or more of the customers in the table are located in San Jose.

	SELECT CNUM, CNAME, CITY
	FROM CUST
	WHERE EXISTS (
    SELECT 1
    FROM CUST
    WHERE CITY = 'San Jose');

63.	Find salespeople no. who have multiple customers.

	SELECT SNUM
	FROM CUST
	GROUP BY SNUM
	HAVING COUNT(CNUM) > 1;

64.	Find salespeople number, name and city who have multiple customers.

	SELECT S.SNUM, S.SNAME, S.CITY
	FROM SALESPEOPLE S
	INNER JOIN CUST C
    ON S.SNUM = C.SNUM
	GROUP BY S.SNUM, S.SNAME, S.CITY
	HAVING COUNT(C.CNUM) > 1;

65.	Find salespeople who serve only one customer.

	SELECT S.SNUM, S.SNAME, S.CITY
	FROM SALESPEOPLE S
	INNER JOIN CUST C
    ON S.SNUM = C.SNUM
	GROUP BY S.SNUM, S.SNAME, S.CITY
	HAVING COUNT(C.CNUM) = 1;

66.	Extract rows of all salespeople with more than one current order.

67.	Find all salespeople who have customers with a rating of 300. (use EXISTS)

68.	Find all salespeople who have customers with a rating of 300. (use Join).

69.	Select all salespeople with customers located in their cities who are not assigned to them. (use EXISTS).

70.	Extract from customers table every customer assigned the a salesperson who currently has at least one other customer ( besides the customer being selected) with orders in order table.

71.	Find salespeople with customers located in their cities ( using both ANY and IN).

72.	Find all salespeople for whom there are customers that follow them in alphabetical order. (Using ANY and EXISTS)

73.	Select customers who have a greater rating than any customer in rome.

74.	Select all orders that had amounts that were greater that atleast one of the orders from Oct 6th.

75.	Find all orders with amounts smaller than any amount for a customer in San Jose. (Both using ANY and without ANY)

76.	Select those customers whose ratings are higher than every customer in Paris. ( Using both ALL and NOT EXISTS).

77.	Select all customers whose ratings are equal to or greater than ANY of the Seeres.

78.	Find all salespeople who have no customers located in their city. ( Both using ANY and ALL)

79.	Find all orders for amounts greater than any for the customers in London.

80.	Find all salespeople and customers located in london.

81.	For every salesperson, dates on which highest and lowest orders were brought.

82.	List all of the salespeople and indicate those who don’t have customers in their cities as well as those who do have.


83.	Append strings to the selected fields, indicating weather or not a given salesperson was matched to a customer in his city.

84.	Create a union of two queries that shows the names, cities and ratings of all customers. Those with a rating of 200 or greater will also have the words ‘High Rating’, while the others will have the words ‘Low Rating’.

85.	Write command that produces the name and number of each salesperson and each customer with more than one current order. Put the result in alphabetical order.

86.	Form a union of three queries. Have the first select the snums of all salespeople in San Jose, then second the cnums of all customers in San Jose and the third the onums of all orders on Oct. 3. Retain duplicates between the last two queries, but eliminates and redundancies between either of them and the first.

87.	Produce all the salesperson in London who had at least one customer there.

88.	Produce all the salesperson in London who did not have customers there.

89.	We want to see salespeople matched to their customers without excluding those salesperson who were not currently assigned to any customers. (User OUTER join and UNION)
