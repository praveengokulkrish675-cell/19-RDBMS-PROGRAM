CREATE DATABASE GOKUL;
USE GOKUL;
DELIMITER //

CREATE PROCEDURE DisplayStudents()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sID INT;
    DECLARE sName VARCHAR(100);
    DECLARE dID INT;

    DECLARE student_cursor CURSOR FOR
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO sID, sName, dID;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT sID AS StudentID,
               sName AS StudentName,
               dID AS DepartmentID;
    END LOOP;

    CLOSE student_cursor;
END //

DELIMITER ;

CALL DisplayStudents();


