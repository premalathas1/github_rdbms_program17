```bash
#!/bin/bash

echo "PL/SQL PROCEDURE AUTOGRADING"

SCORE=0

if [ -f "answers.sql" ]; then
    echo "PASS: answers.sql found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: answers.sql not found."
fi

SQL=$(cat answers.sql 2>/dev/null)
LOWER=$(echo "$SQL" | tr '[:upper:]' '[:lower:]')

if echo "$LOWER" | grep -Eq "create[[:space:]]+or[[:space:]]+replace[[:space:]]+procedure"; then
    echo "PASS: CREATE OR REPLACE PROCEDURE found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: CREATE OR REPLACE PROCEDURE not found."
fi

if echo "$LOWER" | grep -Eq "procedure[[:space:]]+insert_student"; then
    echo "PASS: INSERT_STUDENT procedure found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: INSERT_STUDENT procedure not found."
fi

if echo "$LOWER" | grep -Eq "(p_)?student[_]*id[[:space:]]+in[[:space:]]+number"; then
    echo "PASS: StudentID parameter found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: StudentID parameter not found."
fi

if echo "$LOWER" | grep -Eq "(p_)?student[_]*name[[:space:]]+in[[:space:]]+varchar"; then
    echo "PASS: StudentName parameter found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: StudentName parameter not found."
fi

if echo "$LOWER" | grep -Eq "insert[[:space:]]+into[[:space:]]+student"; then
    echo "PASS: INSERT INTO Student found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: INSERT INTO Student not found."
fi

if echo "$LOWER" | grep -q "studentid"; then
    echo "PASS: StudentID field found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: StudentID field not found."
fi

if echo "$LOWER" | grep -q "begin"; then
    echo "PASS: BEGIN block found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: BEGIN block not found."
fi

if echo "$LOWER" | grep -q "commit"; then
    echo "PASS: COMMIT found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: COMMIT not found."
fi

if echo "$LOWER" | grep -q "dbms_output.put_line"; then
    echo "PASS: DBMS_OUTPUT found."
    SCORE=$((SCORE + 1))
else
    echo "FAIL: DBMS_OUTPUT not found."
fi

echo "SCORE: $SCORE / 10"

if [ "$SCORE" -eq 10 ]; then
    echo "PASS: Assignment completed successfully."
    exit 0
else
    echo "FAIL: Assignment needs correction."
    exit 1
fi
```
