
-- Chinook Database Analysis Project
-- Author: Manthan
-- ============================================

-- Question 1: Which customers have the highest total spend?
SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalSpent
FROM customer c
JOIN invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY TotalSpent DESC
LIMIT 10;

-- Question 2: Which genre sells the most?
SELECT genre.Name AS Genre, SUM(invoiceline.Quantity) AS TotalSold
FROM invoiceline
JOIN track ON invoiceline.TrackId = track.TrackId
JOIN genre ON track.GenreId = genre.GenreId
GROUP BY genre.Name
ORDER BY TotalSold DESC
LIMIT 10;

-- Question 3: Which employee generates the most revenue?
SELECT employee.FirstName, employee.LastName, SUM(invoice.Total) AS RevenueGenerated
FROM employee
JOIN customer ON employee.EmployeeId = customer.SupportRepId
JOIN invoice ON customer.CustomerId = invoice.CustomerId
GROUP BY employee.EmployeeId, employee.FirstName, employee.LastName
ORDER BY RevenueGenerated DESC;

-- Question 4: Which countries generate the most revenue?
SELECT customer.Country, SUM(invoice.Total) AS TotalRevenue
FROM customer
JOIN invoice ON customer.CustomerId = invoice.CustomerId
GROUP BY customer.Country
ORDER BY TotalRevenue DESC;

-- Question 5: Which artists sell the most?
SELECT artist.Name AS Artist, SUM(invoiceline.Quantity) AS TotalSold
FROM invoiceline
JOIN track ON invoiceline.TrackId = track.TrackId
JOIN album ON track.AlbumId = album.AlbumId
JOIN artist ON album.ArtistId = artist.ArtistId
GROUP BY artist.Name
ORDER BY TotalSold DESC
LIMIT 10;

-- Question 6a: What is the average order value?
SELECT AVG(Total) AS AverageOrderValue
FROM invoice;

-- Question 6b: Which customers are repeat buyers?
SELECT customer.CustomerId, customer.FirstName, customer.LastName, COUNT(invoice.InvoiceId) AS OrderCount
FROM customer
JOIN invoice ON customer.CustomerId = invoice.CustomerId
GROUP BY customer.CustomerId, customer.FirstName, customer.LastName
HAVING COUNT(invoice.InvoiceId) > 1
ORDER BY OrderCount DESC;