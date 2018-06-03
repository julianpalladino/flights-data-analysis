#!/bin/bash --
sqlite3 -batch $1 <<"EOF"
create table carriers (
    code varchar(5),
    description varchar(255)
);

.mode csv
.separator ","
.import data/carriers.csv carriers

create index code on carriers(code);
EOF
