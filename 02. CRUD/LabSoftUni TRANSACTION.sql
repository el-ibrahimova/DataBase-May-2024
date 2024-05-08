
-- избира всички незавършени проекти => крайната дата е NULL
SELECT 
* 
FROM Projects 
WHERE EndDate IS NULL;

BEGIN TRANSACTION;

-- ъпдейтваме крайната дата да е днешната
UPDATE Projects 
SET EndDate = GETDATE()
WHERE EndDate IS NULL;

-- отказваме се от TRANSACTION и връщаме старите стойности
ROLLBACK;