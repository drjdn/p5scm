(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

open Sexplib.Conv

type sexpr =
  | Atom of atom
  | Alist of sexpr list
  | Slist of sexpr list
  | Stlist of sexpr list
  | Vlist of sexpr list
  | Plist of sexpr list
  | Lpatt of sexpr * sexpr
  | Toplv of string * string
and atom = typ * string
and typ =
  | Bool
  | Ident
  | Tident
  | Keyword
  | Int
  | Float
  | Op
  | Char
  | String
[@@deriving sexp]
