mysql := \
	mysql \
	--user=ayuda \
	--password=ayuda \
	ayuda

types := créditos total deuda

paises_tsvs := $(types:%=data/tsv/países-%.tsv)
regiones_tsvs := $(types:%=data/tsv/regiones-%.tsv)

tsvs: $(paises_tsvs) $(regiones_tsvs)

$(paises_tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/países-códigos.sql scripts/data/países-códigos.csv
	cat scripts/sql/países-códigos.sql $< | $(mysql) -B > $@

$(regiones_tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/países-códigos.sql scripts/data/países-códigos.csv
	cat scripts/sql/países-códigos.sql $< | $(mysql) -B > $@

.PHONY: tsvs
