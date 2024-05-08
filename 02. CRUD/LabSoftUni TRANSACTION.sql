
-- ������ ������ ����������� ������� => �������� ���� � NULL
SELECT 
* 
FROM Projects 
WHERE EndDate IS NULL;

BEGIN TRANSACTION;

-- ���������� �������� ���� �� � ��������
UPDATE Projects 
SET EndDate = GETDATE()
WHERE EndDate IS NULL;

-- ��������� �� �� TRANSACTION � ������� ������� ���������
ROLLBACK;