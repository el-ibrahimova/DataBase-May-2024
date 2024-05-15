--01. One-to-One Relationship

--02. One-to-Many Relationship 

--03. Many-to-Many Relationship

--04. Self-Referencing

--05. Online Store Database

--06. University Database

--07. SoftUni Design

--08. Geography Design 

-- 09. Peaks in Rila 
SELECT m.MountainRange, p.PeakName, p.Elevation
FROM Mountains AS m
JOIN Peaks AS p ON p.MountainId = m.Id
WHERE m.MountainRange = 'Rila'
ORDER BY p.Elevation DESC;