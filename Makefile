mysql := \
	mysql \
	--user=ayuda \
	--password=ayuda \
	ayuda

tsvs := \
	data/tsv/países-créditos.tsv \
	data/tsv/países-deuda.tsv \
	data/tsv/países-total.tsv

tsvs: $(tsvs)

$(tsvs): data/tsv/%.tsv: scripts/sql/%.sql scripts/sql/países-códigos.sql
	cat scripts/sql/países-códigos.sql $< | $(mysql) -B > $@

.PHONY: tsvs
