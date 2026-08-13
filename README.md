# Chinook Database Business Analysis — SQL Project

## Overview
This project analyzes the Chinook sample database (a digital music store, 11 interconnected tables) to answer six business questions using MySQL. The focus is on multi-table JOINs, aggregation, and grouped analysis

## Dataset
- **Source:** Chinook sample database (official MySQL version)
- **Tables used:** `customer`, `invoice`, `invoiceline`, `track`, `genre`, `album`, `artist`, `employee`
- **Structure:** Customers place orders (invoices), each containing line items (tracks purchased), where each track belongs to an album, artist, and genre; customers are also assigned a support representative (employee)

## Business Questions Answered
1. Which customers have the highest total spend?
2. Which genre sells the most?
3. Which employee generates the most revenue (via their assigned customers)?
4. Which countries generate the most revenue?
5. Which artists sell the most?
6. What is the average order value, and which customers are repeat buyers?

## Approach
- **Aggregation:** `SUM`, `COUNT`, `AVG` combined with `GROUP BY` to roll up transaction-level data into business-level answers
- **JOINs:** Two-table JOINs (customer + invoice) up through four-table chained JOINs (invoiceline → track → album → artist) to connect data spread across the schema
- **HAVING:** Used to filter on aggregated results (e.g., customers with more than one order) — distinct from `WHERE`, which can only filter pre-aggregation
- **Verification:** Compared `INNER JOIN` vs `LEFT JOIN` row counts to confirm every customer in the dataset has made at least one purchase (no customer with zero invoices)

## Key Findings
- **Top customer by spend:** Helena Holý ($49.62), followed closely by Richard Cunningham ($47.62) and Luis Rojas ($46.62) — spend is fairly evenly spread across top customers rather than dominated by one outlier
- **Best-selling genre:** Rock, with 835 units sold — more than double the second-place genre, Latin (386 units)
- **Top-performing employee:** Jane Peacock generated $833.04 in revenue from her assigned customers, ahead of Margaret Park ($775.40) and Steve Johnson ($720.16)
- **Top revenue country:** USA leads with $523.06, followed by Canada ($303.96) and France ($195.10)
- **Best-selling artist:** Iron Maiden leads with 140 units sold, ahead of U2 (107) and Metallica (91)
- **Average order value:** $5.65 per invoice
- **Repeat buyers:** Every customer in the dataset placed exactly 7 orders — indicating this is a uniformly distributed sample dataset rather than one with a genuine "loyal vs one-time" customer split

## Tools Used
- MySQL, MySQL Workbench
  
## Author
Manthan — B.Sc. Statistics (Honours), University of Delhi.
[LinkedIn](https://www.linkedin.com/in/manthan-b2088736a)
