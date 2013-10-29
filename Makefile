mysql := \
	mysql \
	--user=ayuda \
	--password=ayuda \
	ayuda

types := creditos total deuda

paises_tsvs := $(types:%=data/tsv/paises-%.tsv)
regiones_tsvs := $(types:%=data/tsv/regiones-%.tsv)

tsvs: $(paises_tsvs) $(regiones_tsvs)

$(paises_tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/paises-codigos.sql scripts/data/paises-codigos.csv
	cat scripts/sql/paises-codigos.sql $< | $(mysql) -B > $@

$(regiones_tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/paises-codigos.sql scripts/data/paises-codigos.csv
	cat scripts/sql/paises-codigos.sql $< | $(mysql) -B > $@

.PHONY: tsvs
