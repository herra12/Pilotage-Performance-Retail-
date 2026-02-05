SELECT COUNT(*)
FROM `purchasingdb.purchasing_dataset_project.achats `
LIMIT 1000;

SELECT COUNT(DISTINCT SupplierID)
FROM `purchasingdb.purchasing_dataset_project.achats `;


SELECT * FROM `purchasingdb.purchasing_dataset_project.achats `;

SELECT ItemID , SUM(Quantity) AS Total_Quantity
FROM `purchasingdb.purchasing_dataset_project.achats `
WHERE Mois IN ('janvier', 'février', 'mars', 'avril')
GROUP BY ItemID;

SELECT ItemID  , Buyer , SUM(Quantity*UnitPrice)  as SUMQUENTUNIT
FROM `purchasingdb.purchasing_dataset_project.achats `
GROUP BY ItemID , Buyer
ORDER BY SUMQUENTUNIT; 

SELECT i.category,p.buyer, SUM(p.Quantity * p.UnitPrice) AS totalcost
FROM `purchasingdb.purchasing_dataset_project.achats `AS p
JOIN  `purchasingdb.purchasing_dataset_project.Item ` AS i
ON p.ItemID = i.ItemID
GROUP BY i.category , p.buyer
ORDER BY totalcost;





