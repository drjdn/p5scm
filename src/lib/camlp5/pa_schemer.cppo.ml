#include "pa_schemer.orig.ml"

value pa_sch s = Grammar.Entry.parse implem (Stream.of_string s);
