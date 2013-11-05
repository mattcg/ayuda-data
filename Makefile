mysql := \
	mysql \
	--user=ayuda \
	--password=ayuda \
	ayuda \
	-B

types := creditos total deuda

paises_tsvs := $(types:%=data/tsv/paises-%.tsv)
regiones_tsvs := $(types:%=data/tsv/regiones-%.tsv)

tsvs: $(paises_tsvs) $(regiones_tsvs) data/tsv/temas.tsv data/tsv/subtemas.tsv

$(paises_tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/paises-codigos.sql scripts/data/paises-codigos.csv
	cat scripts/sql/paises-codigos.sql $< | $(mysql) > $@

$(regiones_tsvs): data/tsv/%.tsv: scripts/sql/%.sql
	cat $< | $(mysql) > $@

data/tsv/temas.tsv: scripts/sql/temas.sql scripts/sql/temas-codigos.sql scripts/data/temas-codigos.csv
	cat scripts/sql/temas-codigos.sql $< | $(mysql) > $@

data/tsv/subtemas.tsv: scripts/sql/subtemas.sql scripts/sql/temas-codigos.sql scripts/data/temas-codigos.csv
	cat scripts/sql/temas-codigos.sql $< | $(mysql) > $@

.PHONY: tsvs
