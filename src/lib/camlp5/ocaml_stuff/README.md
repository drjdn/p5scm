Adding Support for Older OCaml Versions
---------------------------------------

The [opam](https://opam.ocaml.org) package of `p5scm` only supports `OCaml`
versions >= 4.12.0.  This is for simplicity of maintenance on my part.  Also,
with the advent of `opam` switches I don't see the need to support older
versions, i.e. to support linux distributions that have outdated `OCaml`
compiler toolchains.  Luckily [camlp5](https://github.com/camlp5) has support
for `OCaml` versions going way back.  In this directory are the configuration
files that tell `camlp5` which version of the `OCaml` AST to generate.  So here
`4.12.X` is for the `4.12` version of the compiler.  The AST doesn't change for
bug releases at least not in the time I have been paying attention which is at
least back to `4.10`.  Getting support for an older version is as simply as
copying the appropriate directory for the version you want from
[camlp5/ocaml_stuff](https://github.com/camlp5/camlp5/tree/master/ocaml_stuff)
to this directory and renaming it `4.##.X`.  So for example, if you wanted to
support version `4.06` you would copy `4.06.0` to this directory and call it
`4.06.X`.  That is all there is to it!  If you try this and it doesn't build
properly let me know and I'll try to help out.
