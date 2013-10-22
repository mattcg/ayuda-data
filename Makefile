mysql := \
	mysql \
	--user=ayuda \
	--password=ayuda \
	ayuda

types := créditos total deuda

paises_tsvs := $(types:%=data/tsv/países-%.tsv)
continentes_tsvs := $(types:%=data/tsv/continentes-%.tsv)
subcontinentes_tsvs := $(types:%=data/tsv/subcontinentes-%.tsv)

tsvs: $(paises_tsvs) $(continentes_tsvs) $(subcontinentes_tsvs)

$(paises_tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/países-códigos.sql
	cat scripts/sql/países-códigos.sql $< | $(mysql) -B > $@

$(continentes_tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/continentes-códigos.sql
	cat scripts/sql/continentes-códigos.sql $< | $(mysql) -B > $@

$(subcontinentes_tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/subcontinentes-códigos.sql
	cat scripts/sql/subcontinentes-códigos.sql $< | $(mysql) -B > $@

.PHONY: tsvs
