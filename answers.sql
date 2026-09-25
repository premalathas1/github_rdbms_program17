```sql
CREATE OR REPLACE PROCEDURE insert_student(
    p_student_id IN NUMBER,
    p_student_name IN VARCHAR2,
    p_dob IN DATE,
    p_gender IN VARCHAR2,
    p_department_id IN NUMBER
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
        p_student_id,
        p_student_name,
        p_dob,
        p_gender,
        p_department_id
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Student record inserted successfully.');
END;
/

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
```
