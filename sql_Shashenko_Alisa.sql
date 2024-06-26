/*Задача 1*/
SELECT MAX(TIMESTAMPDIff(YEAR, Student.birthday, NOW())) AS max_year
FROM class
	JOIN Student_in_class ON Class.id = Student_in_class.class
	JOIN Student ON Student_in_class.student = Student.id
WHERE name LIKE "10%";

https://sql-academy.org/trainer/tasks/44?share=c3FsPVNFTEVDVCtNQVglMjhUSU1FU1RBTVBESWZmJTI4WUVBUiUyQytTdHVkZW50LmJpcnRoZGF5JTJDK05PVyUyOCUyOSUyOSUyOStBUyttYXhfeWVhciUwRCUwQUZST00rY2xhc3MlMEQlMEElMDlKT0lOK1N0dWRlbnRfaW5fY2xhc3MrT04rQ2xhc3MuaWQrJTNEK1N0dWRlbnRfaW5fY2xhc3MuY2xhc3MlMEQlMEElMDlKT0lOK1N0dWRlbnQrT04rU3R1ZGVudF9pbl9jbGFzcy5zdHVkZW50KyUzRCtTdHVkZW50LmlkJTBEJTBBV0hFUkUrbmFtZStMSUtFKyUyMjEwJTI1JTIyJTNCJTBEJTBB

/*Задача 2*/
DELETE FROM Company
WHERE id IN (
    SELECT company
    FROM Trip
    GROUP BY company
    HAVING COUNT(*) = (
        SELECT MIN(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Trip
            GROUP BY company
        ) AS minimum
    )
);

https://sql-academy.org/trainer/tasks/55?share=c3FsPURFTEVURStGUk9NK0NvbXBhbnklMEQlMEFXSEVSRStpZCtJTislMjglMEQlMEErKysrU0VMRUNUK2NvbXBhbnklMEQlMEErKysrRlJPTStUcmlwJTBEJTBBKysrK0dST1VQK0JZK2NvbXBhbnklMEQlMEErKysrSEFWSU5HK0NPVU5UJTI4KiUyOSslM0QrJTI4JTBEJTBBKysrKysrKytTRUxFQ1QrTUlOJTI4Y250JTI5JTBEJTBBKysrKysrKytGUk9NKyUyOCUwRCUwQSsrKysrKysrKysrK1NFTEVDVCtDT1VOVCUyOColMjkrQVMrY250JTBEJTBBKysrKysrKysrKysrRlJPTStUcmlwJTBEJTBBKysrKysrKysrKysrR1JPVVArQlkrY29tcGFueSUwRCUwQSsrKysrKysrJTI5K0FTK21pbmltdW0lMEQlMEErKysrJTI5JTBEJTBBJTI5JTNC

/*Задача 3*/
SELECT ROUND(
		(
			SELECT COUNT(DISTINCT u.id)
			FROM Users u
				LEFT JOIN Rooms rom ON rom.owner_id = u.id
				JOIN Reservations res ON res.user_id = u.id
				OR res.room_id = rom.id
		) /(
			SELECT COUNT(1)
			FROM Users
		) * 100,
		2
	) AS percent;

https://sql-academy.org/trainer/tasks/71?share=c3FsPVNFTEVDVCtyb3VuZCUyOCUwQSUwOSUwOSUyOCUwQSUwOSUwOSUwOVNFTEVDVCtDT1VOVCUyOERJU1RJTkNUK3UuaWQlMjklMEElMDklMDklMDlGUk9NK1VzZXJzK3UlMEElMDklMDklMDklMDlMRUZUK0pPSU4rUm9vbXMrcm9tK09OK3JvbS5vd25lcl9pZCslM0QrdS5pZCUwQSUwOSUwOSUwOSUwOUpPSU4rUmVzZXJ2YXRpb25zK3JlcytPTityZXMudXNlcl9pZCslM0QrdS5pZCUwQSUwOSUwOSUwOSUwOU9SK3Jlcy5yb29tX2lkKyUzRCtyb20uaWQlMEElMDklMDklMjkrJTJGJTI4JTBBJTA5JTA5JTA5U0VMRUNUK0NPVU5UJTI4MSUyOSUwQSUwOSUwOSUwOUZST00rVXNlcnMlMEElMDklMDklMjkrKisxMDAlMkMlMEElMDklMDkyJTBBJTA5JTI5K0FTK3BlcmNlbnQlM0I%3D



