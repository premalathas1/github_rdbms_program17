```yaml
name: PL/SQL Procedure Autograding

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  autograding:
    runs-on: ubuntu-latest

    steps:

      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Display repository files
        run: |
          echo "Repository Files"
          find . -maxdepth 3 -type f | sort

      - name: Check test.sh
        run: |
          if [ ! -f "./test.sh" ]; then
            echo "ERROR: test.sh not found in repository root."
            exit 1
          fi
          echo "SUCCESS: test.sh found."

      - name: Display test.sh
        run: |
          echo "----- START test.sh -----"
          nl -ba ./test.sh
          echo "----- END test.sh -----"

      - name: Check test.sh syntax
        run: |
          bash -n ./test.sh
          echo "SUCCESS: test.sh syntax is valid."

      - name: Make test executable
        run: chmod +x ./test.sh

      - name: Run Autograding
        run: ./test.sh
```
