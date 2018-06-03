# -*- coding: utf-8 -*-
import hashlib
import os
import pandas as pd

def query_db(query, conn):
    """Read from sqlite3 db and cache results in a csv file"""
    query_hash = hashlib.md5(query.encode()).hexdigest()
    cache_fname = 'cache/results_{}.csv'.format(query_hash)
    if os.path.exists(cache_fname):
        return pd.read_csv(cache_fname)
    df = pd.read_sql_query(query, conn)
    df.to_csv(cache_fname)
    return df
