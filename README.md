# Métodos Numéricos TP3

## Dependencias

* Python 3
* sqlite3

### Paquetes de Python

* numpy
* pandas
* scikit-learn
* matplotlib
* seaborn
* jupyter

## Preparación

Para descargar y descomprimir los datos, correr `tools/download_data.sh` desde
la raíz del proyecto.  Los archivos CSV van a quedar en el directorio `data/`

Luego correr lo siguiente para popular la base de datos y crear los índices:

```
tools/load_ontime.sh vuelos.db
tools/load_airports.sh vuelos.db
tools/load_carriers.sh vuelos.db
tools/create_indexes.sh vuelos.db
```

## Notebooks

Correr `jupyter notebook` desde la raíz del proyecto. Dentro del directorio
`notebooks/` están los archivos utilizados para la experimentación. En
particular ver:

1. Hora de salida y delay
2. Analisis carriers
