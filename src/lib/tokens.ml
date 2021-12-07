(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

type token =
  | LPR
  | RPR
  | LSQ
  | RSQ
  | VLPR
  | LCL
  | RCL
  | DOT
  | TOPL of string
  | BOOL of string
  | IDENT of string
  | TIDENT of string
  | KEYWORD of string
  | INT of string
  | FLOAT of string
  | OP of string
  | CHAR of string
  | STRING of string
  | EOF
