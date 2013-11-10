.DELETE_ON_ERROR:

mysql := \
	mysql \
	--user=ayuda \
	--password=ayuda \
	ayuda \
	-B

tsvs: data/tsv/paises.tsv data/tsv/regiones.tsv data/tsv/temas.tsv data/tsv/subtemas.tsv

data/tsv/paises.tsv: scripts/sql/paises.sql scripts/sql/paises-codigos.sql scripts/data/paises-codigos.csv
	cat scripts/sql/paises-codigos.sql $< | $(mysql) > $@

data/tsv/regiones.tsv: scripts/sql/regiones.sql
	cat $< | $(mysql) > $@

data/tsv/temas.tsv: scripts/sql/temas.sql scripts/sql/temas-codigos.sql scripts/data/temas-codigos.csv
	cat scripts/sql/temas-codigos.sql $< | $(mysql) > $@

data/tsv/subtemas.tsv: scripts/sql/subtemas.sql scripts/sql/temas-codigos.sql scripts/data/temas-codigos.csv
	cat scripts/sql/temas-codigos.sql $< | $(mysql) > $@

.PHONY: tsvs
