# Tournament Results

This program connects a Python module to a PostgreSQL database for keeping track of players and matches in a Swiss-style tournament. As part of the program, a test is run to determine whether or not the Python module can successfully interact with the database.

Dependencies:
- Python 2.7
- PostgreSQL
- psycopg2

Running the program:
1) From the folder containing tournament_test.py, tournament.py, and tournament.sql, enter the psql terminal and import tournament.sql by entering: \i tournament.sql

2) Exit psql, and from the terminal, enter: python tournament_test.py

3) Review the tests printed to the terminal window. If all tests are successful, a final confirmation message will be printed.
