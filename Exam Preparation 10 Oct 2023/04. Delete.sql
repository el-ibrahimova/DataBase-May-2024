-- �������� ID  �� ������� � �������� ��������
-- ��������� Foreign key �������� �� ������� �������, �� �� ������� ���������
DELETE 
FROM Invoices 
WHERE ClientId =11;  

DELETE 
FROM ProductsClients 
WHERE ClientId =11;

-- ��������� ������ �� ��������� � �������� ��������
DELETE 
FROM Clients 
WHERE NumberVAT LIKE 'IT%'