#!/bin/bash

echo "=========================================="
echo " PL/SQL PROCEDURE AUTOGRADING"
echo "=========================================="

FILE="answers.sql"

if [ ! -f "$FILE" ]; then
    echo "FAIL: answers.sql not found."
    exit 1
fi

echo "PASS: answers.sql found."

CONTENT=$(cat "$FILE" | tr '[:upper:]' '[:lower:]')

# Test 1: CREATE PROCEDURE
if echo "$CONTENT" | grep -q "create or replace procedure"; then
    echo "PASS: CREATE OR REPLACE PROCEDURE found."
else
    echo "FAIL: CREATE OR REPLACE PROCEDURE not found."
    exit 1
fi

# Test 2: Procedure name
if echo "$CONTENT" | grep -q "procedure insert_student"; then
    echo "PASS: INSERT_STUDENT procedure found."
else
    echo "FAIL: INSERT_STUDENT procedure not found."
    exit 1
fi

# Test 3: StudentID parameter
if echo "$CONTENT" | grep -q "p_studentid"; then
    echo "PASS: StudentID parameter found."
else
    echo "FAIL: StudentID parameter not found."
    exit 1
fi

# Test 4: StudentName parameter
if echo "$CONTENT" | grep -q "p_studentname"; then
    echo "PASS: StudentName parameter found."
else
    echo "FAIL: StudentName parameter not found."
    exit 1
fi

# Test 5: DOB parameter
if echo "$CONTENT" | grep -q "p_dob"; then
    echo "PASS: DOB parameter found."
else
    echo "FAIL: DOB parameter not found."
    exit 1
fi

# Test 6: Gender parameter
if echo "$CONTENT" | grep -q "p_gender"; then
    echo "PASS: Gender parameter found."
else
    echo "FAIL: Gender parameter not found."
    exit 1
fi

# Test 7: DepartmentID parameter
if echo "$CONTENT" | grep -q "p_departmentid"; then
    echo "PASS: DepartmentID parameter found."
else
    echo "FAIL: DepartmentID parameter not found."
    exit 1
fi

# Test 8: INSERT INTO Student
if echo "$CONTENT" | grep -q "insert into student"; then
    echo "PASS: INSERT INTO Student found."
else
    echo "FAIL: INSERT INTO Student not found."
    exit 1
fi

# Test 9: VALUES
if echo "$CONTENT" | grep -q "values"; then
    echo "PASS: VALUES clause found."
else
    echo "FAIL: VALUES clause not found."
    exit 1
fi

# Test 10: END
if echo "$CONTENT" | grep -q "end;"; then
    echo "PASS: END statement found."
else
    echo "FAIL: END statement not found."
    exit 1
fi

echo ""
echo "=========================================="
echo " ALL TESTS PASSED"
echo "=========================================="

exit 0
