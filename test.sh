```bash
#!/bin/bash

echo "=========================================="
echo " PL/SQL PROCEDURE AUTOGRADING"
echo "=========================================="

SCORE=0

if [ ! -f answers.sql ]; then
    echo "FAIL: answers.sql not found."
    exit 1
fi

echo "PASS: answers.sql found."
SCORE=$((SCORE+1))

SQL=$(cat answers.sql)

# Convert to lowercase and remove spaces for easier checking
LOWER=$(echo "$SQL" | tr '[:upper:]' '[:lower:]')

if echo "$LOWER" | grep -q "create or replace procedure"; then
    echo "PASS: CREATE OR REPLACE PROCEDURE found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: CREATE OR REPLACE PROCEDURE not found."
fi

if echo "$LOWER" | grep -q "insert_student"; then
    echo "PASS: INSERT_STUDENT procedure found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: INSERT_STUDENT procedure not found."
fi

if echo "$LOWER" | grep -Eq "student[_]*id[[:space:]]+in[[:space:]]+number"; then
    echo "PASS: StudentID parameter found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: StudentID parameter not found."
fi

if echo "$LOWER" | grep -Eq "student[_]*name[[:space:]]+in[[:space:]]+varchar"; then
    echo "PASS: StudentName parameter found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: StudentName parameter not found."
fi

if echo "$LOWER" | grep -q "insert into student"; then
    echo "PASS: INSERT INTO Student found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: INSERT INTO Student not found."
fi

if echo "$LOWER" | grep -q "studentid"; then
    echo "PASS: StudentID field found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: StudentID field not found."
fi

if echo "$LOWER" | grep -q "begin"; then
    echo "PASS: Procedure execution block found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: Procedure execution block not found."
fi

if echo "$LOWER" | grep -q "commit"; then
    echo "PASS: COMMIT found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: COMMIT not found."
fi

if echo "$LOWER" | grep -q "dbms_output.put_line"; then
    echo "PASS: DBMS_OUTPUT found."
    SCORE=$((SCORE+1))
else
    echo "FAIL: DBMS_OUTPUT not found."
fi

echo "------------------------------------------"
echo "SCORE: $SCORE / 10"
echo "------------------------------------------"

if [ "$SCORE" -eq 10 ]; then
    echo "PASS: Assignment completed successfully."
    exit 0
else
    echo "FAIL: Please correct the assignment."
    exit 1
fi
```
