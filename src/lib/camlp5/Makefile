.PHONY: all pa_scheme pr_o pr_dump exparser pconfig

all: pa_scheme pr_o pr_dump exparser pconfig


VERSION = $(shell ocamlc get_version.ml -o get_version; ./get_version)

pa_scheme:
	cppo pa_schemer.cppo.ml -o pa_schemer.ml
	camlp5 pa_r.cmo pa_rp.cmo pa_extend.cmo q_MLast.cmo pr_o.cmo pa_schemer.ml -o ../pa_scheme.ml

pr_o:
	cppo pr_o.cppo.ml -o pr_o.ml
	camlp5 pa_r.cmo pa_rp.cmo pa_macro.cmo q_MLast.cmo pa_extfun.cmo pa_extprint.cmo pa_pprintf.cmo q_MLast.cmo pr_o.cmo pr_o.ml -o ../pr_o.ml

pr_dump:
	cppo pr_dump.cppo.ml -o pr_dump.ml
	camlp5 pa_r.cmo pr_o.cmo pr_dump.ml -o ../pr_dump.ml

exparser:
	camlp5 pa_r.cmo q_MLast.cmo pr_o.cmo exparser.ml -o ../exparser.ml
	camlp5 pa_r.cmo q_MLast.cmo pr_o.cmo exparser.mli -o ../exparser.mli

pconfig:
	cp ./ocaml_stuff/$(VERSION)/utils/pconfig.ml ../pconfig.ml
