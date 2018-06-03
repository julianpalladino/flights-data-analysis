#!/bin/bash --
sqlite3 -batch $1 <<"EOF"
create table ontime (
  Year int,
  Month int,
  DayofMonth int,
  DayOfWeek int,
  DepTime  int,
  CRSDepTime int,
  ArrTime int,
  CRSArrTime int,
  UniqueCarrier varchar(5),
  FlightNum int,
  TailNum varchar(8),
  ActualElapsedTime int,
  CRSElapsedTime int,
  AirTime int,
  ArrDelay int,
  DepDelay int,
  Origin varchar(3),
  Dest varchar(3),
  Distance int,
  TaxiIn int,
  TaxiOut int,
  Cancelled int,
  CancellationCode varchar(1),
  Diverted varchar(1),
  CarrierDelay int,
  WeatherDelay int,
  NASDelay int,
  SecurityDelay int,
  LateAircraftDelay int
);

.mode csv
.separator ","
.import data/1987.csv ontime
.import data/1988.csv ontime
.import data/1989.csv ontime
.import data/1990.csv ontime
.import data/1991.csv ontime
.import data/1992.csv ontime
.import data/1993.csv ontime
.import data/1994.csv ontime
.import data/1995.csv ontime
.import data/1996.csv ontime
.import data/1997.csv ontime
.import data/1998.csv ontime
.import data/1999.csv ontime
.import data/2000.csv ontime
.import data/2001.csv ontime
.import data/2002.csv ontime
.import data/2003.csv ontime
.import data/2004.csv ontime
.import data/2005.csv ontime
.import data/2006.csv ontime
.import data/2007.csv ontime
.import data/2008.csv ontime

delete from ontime where typeof(year) == "text";
EOF
