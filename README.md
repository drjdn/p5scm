A Scheme Implementation using Pa_schemer from Camlp5
====================================================

This repository contains a scheme implementation based on
[pa_schemer.ml](https://github.com/camlp5/camlp5/blob/master/etc/pa_schemer.ml)
which is included as an extension of [camlp5](https://camlp5.github.io).  This
provides a scheme-like syntax for [OCaml](https://ocaml.org).  The
[camlp5](https://github.com/camlp5/camlp5/blob/master/doc/rst/scheme.rst)
documentation for the scheme extension provides the following comparison between
`OCaml` and `scheme` syntax:

| OCaml                                | Scheme
| ------------------------------------ | ----------------------------------
| let x = 42;;                         | (define x  42)
| let f x = 0;;                        | (define (f x) 0)
| let rec f x y = 0;;                  | (definerec (f x y) 0)
| let x = 42 and y = 27 in x + y;;     | (let ((x 42) (y 27)) (+ x y))
| let x = 42 in let y = 27 in x + y;;  | (let* ((x 42) (y 27)) (+ x y))
| module M = struct ... end;;          | (module M (struct ...))
| type 'a t = A of 'a * int \| B       | (type (t 'a) (sum (A 'a int) (B)))
| fun x y -> x                         | (lambda (x y) x)
| x; y; z                              | (begin x y z)
| f x y                                | (f x y)
| [1; 2; 3]                            | [1 2 3]
| a, b, c                              | (values a b c)
| match x with 'A'..'Z' -> "x"         | (match x ((range 'A' 'Z') "x")))
| {x = y; z = t}                       | {(x y) (z t)}

`p5scm` also provides the following:

| OCaml                                | Scheme
| ------------------------------------ | ----------------------------------
| [\|1; 2; 3\|]                        | #(1 2 3)

which is provided via a simple
[menhir](http://gallium.inria.fr/~fpottier/menhir/) parser that supports all of
the syntax above. 

Installation
------------

As long as you have a current version of [opam](https://opam.ocaml.org),
installation is as simple as:
```bash
$ opam install p5scm
```

You can then use it to parse and emit `OCaml` bytecode that can then be used in
your OCaml project:

```bash
$ p5scm file1.scm
```

You can also start an interpreter for `p5scm`:

```bash
$ p5sch-utop
```

which uses [utop](https://opam.ocaml.org/blog/about-utop/) for code completion
and many of the other benefits that it provides.  Currently both the `#require`
and `#use` directives of `utop` function in the interpreter/REPL (same syntax as
`utop` however no terminating `;;` required).

Only `OCaml` versions >= 4.12.0 are supported by the `opam` package.
Instructions for adding support for older versions can be found
([here](https://github.com/drjdn/p5scm/blob/main/src/lib/camlp5/ocaml_stuff/README.md)).

License
-------

[MIT](https://github.com/drjdn/p5scm/blob/master/LICENSE.md)
