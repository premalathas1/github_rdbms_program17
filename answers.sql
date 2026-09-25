CREATE OR REPLACE PROCEDURE insert_student(
    StudentID      IN NUMBER,
    StudentName    IN VARCHAR2,
    DOB            IN DATE,
    Gender         IN VARCHAR2,
    DepartmentID   IN NUMBER
)
IS
BEGIN
    INSERT INTO Student
    (
        StudentID,
        StudentName,
        DOB,
        Gender,
        DepartmentID
    )
    VALUES
    (
        StudentID,
        StudentName,
        DOB,
        Gender,
        DepartmentID
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Student record inserted successfully.');
END;
/

-- Execute the procedure

BEGIN
    insert_student(
        1001,
        'Arun',
        DATE '2004-05-15',
        'Male',
        101
    );
END;
/

-- Display the inserted record

SELECT * FROM Student;
```
