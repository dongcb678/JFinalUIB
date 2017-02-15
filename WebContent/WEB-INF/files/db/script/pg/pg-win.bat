@echo off

if not exist %7 (
	md %7  
)

set PGPASSWORD=%3
%1\\pg_dump --host %4 --port %5 --username %2 --format custom --blobs --encoding UTF8 --dbname "%6" --file %7\\%8
