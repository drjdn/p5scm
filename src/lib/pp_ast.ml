(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

open Ast
open Sexp_pretty

let rec ast_to_p5scm = function
  | Plist i -> String.concat "\n" (List.map ast_to_p5scm i)
  | Slist i -> "(" ^ String.concat " " (List.map ast_to_p5scm i) ^ ")"
  | Stlist i -> "{" ^ String.concat " " (List.map ast_to_p5scm i) ^ "}"
  | Vlist i -> "#(" ^ String.concat " " (List.map ast_to_p5scm i) ^ ")"
  | Alist i -> "[" ^ String.concat " " (List.map ast_to_p5scm i) ^ "]"
  | Lpatt (i, j) -> "[" ^ (ast_to_p5scm i) ^ " . " ^ (ast_to_p5scm j) ^ "]"
  | Atom (_, i) -> i
  | Toplv (i, j) -> utop_action i j
and utop_action s1 s2 =
  match s1 with
  | "#require" -> "(UTop.require [" ^ s2 ^ "])"
  | "#use" -> "(Toploop.use_file Format.std_formatter " ^ s2 ^")"
  | _ -> failwith "Not a known utop directive!"
