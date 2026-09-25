```bash
#!/bin/bash

echo "=========================================="
echo " PL/SQL PROCEDURE AUTOGRADING"
echo "=========================================="

SCORE=0
TOTAL=10

# 1. Check answers.sql
if [ -f "answers.sql" ]; then
    echo "PASS: answers.sql found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: answers.sql not found."
    exit 1
fi

# Read the student's answer
SQL=$(cat answers.sql)

# Convert to lowercase
LOWER=$(echo "$SQL" | tr '[:upper:]' '[:lower:]')

# 2. CREATE OR REPLACE PROCEDURE
if echo "$LOWER" | grep -Eq "create[[:space:]]+or[[:space:]]+replace[[:space:]]+procedure"; then
    echo "PASS: CREATE OR REPLACE PROCEDURE found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: CREATE OR REPLACE PROCEDURE not found."
fi

# 3. INSERT_STUDENT procedure
if echo "$LOWER" | grep -Eq "procedure[[:space:]]+insert_student"; then
    echo "PASS: INSERT_STUDENT procedure found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: INSERT_STUDENT procedure not found."
fi

# 4. StudentID parameter
if echo "$LOWER" | grep -Eq "(p_)?student[_]*id[[:space:]]+in[[:space:]]+number"; then
    echo "PASS: StudentID parameter found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: StudentID parameter not found."
fi

# 5. StudentName parameter
if echo "$LOWER" | grep -Eq "(p_)?student[_]*name[[:space:]]+in[[:space:]]+varchar"; then
    echo "PASS: StudentName parameter found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: StudentName parameter not found."
fi

# 6. INSERT INTO Student
if echo "$LOWER" | grep -Eq "insert[[:space:]]+into[[:space:]]+student"; then
    echo "PASS: INSERT INTO Student found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: INSERT INTO Student not found."
fi

# 7. StudentID field
if echo "$LOWER" | grep -q "studentid"; then
    echo "PASS: StudentID field found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: StudentID field not found."
fi

# 8. Procedure execution
if echo "$LOWER" | grep -Eq "begin[[:space:]]+insert_student|insert_student[[:space:]]*\("; then
    echo "PASS: Procedure execution found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: Procedure execution not found."
fi

# 9. COMMIT
if echo "$LOWER" | grep -q "commit"; then
    echo "PASS: COMMIT found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: COMMIT not found."
fi

# 10. DBMS_OUTPUT
if echo "$LOWER" | grep -q "dbms_output.put_line"; then
    echo "PASS: DBMS_OUTPUT found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: DBMS_OUTPUT not found."
fi

echo "=========================================="
echo " SCORE: $SCORE / $TOTAL"
echo "=========================================="

if [ "$SCORE" -eq "$TOTAL" ]; then
    echo "PASS: PL/SQL procedure assignment completed."
    exit 0
else
    echo "FAIL: Assignment needs correction."
    exit 1
fi
```
