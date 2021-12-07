(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

open Lexing

let ppos lexbuf =
  let p = lexbuf.lex_curr_p in
  Printf.printf
    "File: %s, line: %d, col: %d, token: %s \n"
    p.pos_fname
    p.pos_lnum
    (p.pos_cnum - p.pos_bol)
    (lexeme lexbuf)

let pspos lexbuf =
  let p = lexbuf.lex_curr_p in
  Printf.sprintf
    "File: %s, line: %d, col: %d, token: %s"
    p.pos_fname
    p.pos_lnum
    (p.pos_cnum - p.pos_bol)
    (lexeme lexbuf)

let lexeme lexbuf = Lexing.lexeme lexbuf
let new_line lexbuf = Lexing.new_line lexbuf
let dp_str str = string_of_float (float_of_string str)

let p5_bool str =
  match str with
  | "true" -> "True"
  | "false" -> "False"
  | _ -> failwith "Not a boolean!"

let extra_kwds = [ "define"; "definerec"; "lambda"; "lambda_match"; "let*"; "range"; "sum"; "values" ]
let is_kwds kwds lst = List.mem kwds lst

let map_ident str =
  match is_kwds str extra_kwds with
  | true -> Tokens.KEYWORD str
  | false -> Tokens.IDENT str

let in_topl = ref false

let topl_err lexbuf =
  print_endline "Toplevel commands only allowed in repl!";
  pspos lexbuf

let check_topl lexbuf = if not !in_topl then failwith (topl_err lexbuf)
