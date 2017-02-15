#!/bin/sh

#backup postgresql database

if [ ! -d "$1" ];then
	mkdir -p "$1"
fi

if [ -r /home/postgres/.bash_profile ]; then
	source /home/postgres/.bash_profile
fi

if [ -r /var/lib/pgsql/.bash_profile ]; then
	source /var/lib/pgsql/.bash_profile
fi

if [ -n "$PGHOME" ]; then
	cmd_line=$PGHOME/bin/pg_dump
elif [ -d /opt/pg94 ]; then
	cmd_line=/opt/pg94/bin/pg_dump
else
	cmd_line=pg_dump
fi

export PGPASSWORD=$3
"$cmd_line" --host $4 --port $5 --username $2 --format custom --blobs --encoding UTF8 --dbname "$6" --file "$1/$7"

#delete expire files, only keep 10 files.
#find "$1" -name "*" -mtime 1 |xargs rm -f
cd "$1"
file_count=`ls -l|grep "^-"|wc -l`
if [ $file_count -gt 10 ]; then
	sum=$[10-$file_count]
	ls -tF|grep [^/]$|tail -n "$sum"|xargs rm -f
fi

exit 0
