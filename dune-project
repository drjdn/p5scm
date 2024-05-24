(lang dune 2.8)
(name p5scm)
(version 0.4.0)
(using menhir 2.1)

(generate_opam_files true)

(source (github drjdn/p5scm))
(license MIT)
(authors "Jason D. Nielsen")
(maintainers "drjdnielsen@gmail.com")

(package
 (name p5scm)
 (synopsis "Scheme via camlp5")
 (description "This a simple scheme implementation using pa_schemer from camlp5")
 (depends
  (ocaml (and (>= 4.12.0) (< 4.15.0)))
  (menhir (>= 20201214))
  (cppo	(>= 1.6.6))
  (camlp5 (>= 8.03.00))
  (sexp_pretty (>= v0.14.0))
  (ppx_sexp_conv (>= v0.14.0))
  (utop (>= 2.7.0))))
