(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

{
open Tokens
open Lexer_utils
}

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"
let digit = ['0'-'9']
let int = digit+
let deci = int '.' int | int '.' | '.' int
let p10 = ['e' 'E'] ['+' '-']? int
let float = int p10 | deci p10?
let letter = [ 'a'-'z' 'A'-'Z']
let id_head = letter | '_'
let id_tail = letter | digit | [ '.' '_' '\'' ] 
let ident = id_head id_tail*
let tident = "\'" ident
let char1 = "\'" [^ '\\' '\'' '\010' '\013'] "\'"
let char2 = "\'\\" ['\\' '\'' '\"' 'n' 't' 'b' 'r' ' '] "\'"
let char3 = "\'\\" ['0'-'9'] ['0'-'9'] ['0'-'9'] "\'"
let char = char1 | char2 | char3
let string = '\"' ([^ '\"' '\\' ] | ([ '\\' ] [^ '_' ]))* '\"'
let op = '+' | '-' | '*' | '/' | "**" | "+." | "-." | "*." | "/." | ":=" | "==" |
         "!=" | '=' | "<>" | '>' | '<' | ">=" | "<=" | ":" | "&&" | "||" | "::" |
         "->" | '!' | '^'
let bool = "true" | "false"
let topl = "#" letter+

rule tok = 
  parse
  | white    { tok lexbuf }
  | newline  { new_line lexbuf; tok lexbuf }
  | topl     { check_topl lexbuf; TOPL (lexeme lexbuf) }
  | "("      { LPR }
  | ")"      { RPR }
  | "["      { LSQ }
  | "]"      { RSQ }
  | "#("     { VLPR }
  | "{"      { LCL }
  | "}"      { RCL }
  | "."      { DOT }
  | op       { OP(lexeme lexbuf) }
  | bool     { BOOL(p5_bool (lexeme lexbuf)) }  
  | ident    { map_ident(lexeme lexbuf) }
  | tident   { TIDENT(lexeme lexbuf) }
  | int      { INT(lexeme lexbuf) }
  | float    { FLOAT(dp_str (lexeme lexbuf)) }
  | char     { CHAR(lexeme lexbuf) }
  | string   { STRING(lexeme lexbuf) }
  | _        { failwith (pspos lexbuf) }
  | eof      { EOF }
