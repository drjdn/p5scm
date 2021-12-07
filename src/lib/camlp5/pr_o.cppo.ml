#include "pr_o.orig.ml"

value pr_o e = Eprinter.apply pr_str_item Pprintf.empty_pc e;
