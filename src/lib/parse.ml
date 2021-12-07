(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

open Lexer_utils

let parse_with_error lexbuf =
  try Parser.prog Lexer.tok lexbuf with
  | Parser.Error -> failwith (pspos lexbuf)

let parse_from_chan chan =
  let lexbuf = Lexing.from_channel chan in
  parse_with_error lexbuf

let parse_from_string str =
  let lexbuf = Lexing.from_string str in
  parse_with_error lexbuf

let parse_to_tp lexbuf =
  let ast = parse_with_error lexbuf in
  let p5str = Pp_ast.ast_to_p5scm ast in
  Trans.scm_to_tp p5str

let parse_to_tp_lst lexbuf =
  let ast = parse_with_error lexbuf in
  let p5str = Pp_ast.ast_to_p5scm ast in
  Trans.scm_to_tp_lst p5str

let parse_to_bin chan =
  let lexbuf = Lexing.from_channel chan in
  let ast = parse_with_error lexbuf in
  let p5str = Pp_ast.ast_to_p5scm ast in  
  Trans.scm_to_bin p5str

let parse_to_file chan =
  let lexbuf = Lexing.from_channel chan in
  let ast = parse_with_error lexbuf in
  let p5str = Pp_ast.ast_to_p5scm ast in  
  Trans.scm_to_bin_file p5str (Filename.temp_file ~temp_dir:"./" "test" ".ml")
