#!/usr/bin/env python3
import sys
import sqlite3
import datetime
from tqdm import tqdm

new_ts_column_names = ('DepTimestamp', 'CRSDepTimestamp')
time_column_names = ('DepTime', 'CRSDepTime')

def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d

def add_ts_column(name):
    try:
        conn.execute('alter table ontime add column `{}` integer'.format(name))
    except sqlite3.OperationalError as err:
        print(err)

if __name__ == '__main__':
    db_fname = sys.argv[1]
    conn = sqlite3.connect(db_fname)
    conn.row_factory = dict_factory

    # Add timestamp columns
    for time_col in new_ts_column_names:
        add_ts_column(time_col)

    # Get total
    total = conn.execute('select count(*) as total from ontime').fetchone()['total']

    # Update values
    for i, r in tqdm(enumerate(conn.execute('select rowid, * from ontime')), total=total):
        res = {}

        for time_col, new_time_col in zip(time_column_names, new_ts_column_names):
            if r[time_col] == 'NA':
                continue

            hourmin_s = str(r[time_col]).rjust(4, '0')
            hour = hourmin_s[0:2]
            minutes = hourmin_s[2:4]

            if int(hour) >= 24:
                continue

            if int(minutes) >= 60:
                continue

            datetime_str = '{year}-{month}-{day} {hour}:{minutes}:00'.format(
                    year=r['Year'],
                    month=str(r['Month']).rjust(2, '0'),
                    day=str(r['DayofMonth']).rjust(2, '0'),
                    hour=hour,
                    minutes=minutes)
            try:
                ts = int(datetime.datetime.strptime(datetime_str, '%Y-%m-%d %H:%M:%S').strftime("%s"))
            except:
                __import__('pdb').set_trace()
            res[new_time_col] = ts

        values = ', '.join(['{} = {}'.format(col, val) for (col, val) in res.items()])
        update_query = 'update ontime set {} where rowid = {}'.format(values, r['rowid'])
        conn.execute(update_query)

        if i % 10000 == 0:
            conn.commit()

    conn.close()
