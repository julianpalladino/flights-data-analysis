# Flights data analysis

## Documentation
* All documentation can be found in **Documentation - Informe.pdf**. This includes development and experimentation

## Dependencies

* Python 3
* sqlite3

### Python packages

* numpy
* pandas
* scikit-learn
* matplotlib
* seaborn
* jupyter

## Preparación

To download and unzip the data, run `tools/download_data.sh` from the main directory. CSV files will be stored in the directory `data/`

Then, run the following to fill the database and create the indexes:

```
tools/load_ontime.sh vuelos.db
tools/load_airports.sh vuelos.db
tools/load_carriers.sh vuelos.db
tools/create_indexes.sh vuelos.db
```

## Notebooks

Run `jupyter notebook` from the main directory. Inside the directory `notebooks/` there are the files used for experimentation. Mainly see:

1. Hora de salida y delay
2. Analisis carriers
