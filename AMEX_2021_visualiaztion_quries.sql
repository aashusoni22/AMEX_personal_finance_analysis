
-- FOR VISUALIZATION


-- Looking at total spend per item in year 2021

SELECT DISTINCT description, SUM(amount) AS total_spend
FROM AMEX..Amex
WHERE YEAR(date) = 2021 AND transaction_type = 'Purchase'
GROUP BY description
ORDER BY total_spend DESC
LIMIT 5


-- # PURCHASES (Online and In-store)

-- Comparing total spend on online purchases per month for 2021

SELECT MONTH(date) AS month, 
		SUM(CASE WHEN YEAR(date) = 2021 THEN amount END) AS total_spent_2021
FROM AMEX..Amex
WHERE description LIKE 'AMZN% ' OR upper(description) LIKE 'AMAZON%' OR upper(description) LIKE 'CHILDERNS%' OR upper(description) LIKE 'ARDEN%'
					OR upper(description) LIKE 'FEDEX%' OR upper(description) LIKE 'UDEMY%' OR upper(description) LIKE 'NIKE%' 
					OR upper(description) LIKE 'IMMIGRATION%' OR upper(description) LIKE 'CV%' OR upper(description) LIKE 'EBAY%'
					OR upper(description) LIKE 'PAYTM%' OR upper(description) LIKE 'OEIS%' OR upper(description) LIKE 'KINDLE%'
					OR upper(description) LIKE 'ONTARIO%'
GROUP BY MONTH(date)


-- Now looking at total spend In-store purchases per month for 2021

SELECT MONTH(date) AS month, 
		SUM(CASE WHEN YEAR(date) = 2021 THEN amount END) AS total_spent_2021
FROM AMEX..Amex
WHERE upper(description) LIKE 'ESSO% ' OR upper(description) LIKE 'MACS%' OR upper(description) LIKE 'WELLINGTON%' OR upper(description) LIKE 'WAL-MART%'
					OR upper(description) LIKE 'BATH%' OR upper(description) LIKE 'MCQUADE%' OR upper(description) LIKE 'SHOPPERS%' 
					OR upper(description) LIKE 'DOLLARAMA%' OR upper(description) LIKE 'HIWAY%'
GROUP BY MONTH(date)


-- # ONLINE FOOD ORDER & GROCERIES

-- Looking at total spend on online food order per month for 2021 

SELECT MONTH(date) AS month, 
		SUM(CASE WHEN YEAR(date) = 2021 THEN amount END) AS total_spent_2021
FROM AMEX..Amex
WHERE (upper(description) LIKE 'SKIPTHE%' OR upper(description) LIKE 'DOMINOS%' OR upper(description) LIKE 'TANDOORI%' 
		OR upper(description) LIKE 'A&W%' OR upper(description) LIKE 'TIM HORT%' OR upper(description) LIKE 'ZOMATO%'
		OR upper(description) LIKE 'UBER EATS%') 
GROUP BY MONTH(date)


-- Looking at total spend on groceries per month in 2021

SELECT MONTH(date) AS month, 
		SUM(CASE WHEN YEAR(date) = 2021 THEN amount END) AS total_spent_2021
FROM AMEX..Amex
WHERE upper(description) LIKE 'FOOD BASIC%' OR upper(description) LIKE 'INDIAN BAZAR%' OR upper(description) LIKE 'INSTA CART%'
		OR upper(description) LIKE 'METRO%'
GROUP BY MONTH(date)


-- Looking at total interest charged per month

SELECT SUM(amount) AS interest_charged_per_year
FROM AMEX..Amex
WHERE YEAR(date) = 2021 AND transaction_type = 'Interest'


-- Looking at how much $ used per year 

SELECT (1300*12) AS credit_limit_per_year, SUM(amount) AS total_limit_used
FROM AMEX..Amex
WHERE YEAR(date) = 2021 AND transaction_type = 'Payment'

-- Total Cash back in 2021

SELECT SUM(amount) AS total_cash_back
FROM AMEX..Amex
WHERE transaction_type = 'Cash back'
