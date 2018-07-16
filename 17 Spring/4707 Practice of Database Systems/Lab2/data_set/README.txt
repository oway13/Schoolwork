README

.dat file contain the data to be inserted into the PostgreSQL.
The .sql files contain the script to do the insertion into PostgreSQL.

To insert all data to the Database:
1. Start the server and the psql (instruction in pdf)
2. Update the "<PATH_TO_DAT_FILE>" in the ".sql" file to the path of the dat file.
3. In psql, the command to do the insertion is: "\i <PATH_TO_SQL_FILE>/buffer_add.sql"
