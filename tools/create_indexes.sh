#!/bin/bash --
sqlite3 -batch $1 <<"EOF"
create index year on ontime(year);
create index date on ontime(year, month, dayofmonth);
--create index origin on ontime(origin);
--create index dest on ontime(dest);
EOF
