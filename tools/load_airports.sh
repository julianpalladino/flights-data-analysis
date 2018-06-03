#!/bin/bash --
sqlite3 -batch $1 <<"EOF"
create table airports (
    iata varchar(3),
    airport varchar(255),
    city varchar(255),
    state varchar(2),
    country varchar(3),
    lat real,
    long real
);

.mode csv
.separator ","
.import data/airports.csv airports

create index iata on airports(iata);
EOF
