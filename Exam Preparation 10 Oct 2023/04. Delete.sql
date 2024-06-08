-- намираме ID  на клиента с търсения критерий
-- изтриваме Foreign key връзките от другите таблици, за да откачим релациите
DELETE 
FROM Invoices 
WHERE ClientId =11;  

DELETE 
FROM ProductsClients 
WHERE ClientId =11;

-- изтриваме записа от таблицата с търсения критерий
DELETE 
FROM Clients 
WHERE NumberVAT LIKE 'IT%'