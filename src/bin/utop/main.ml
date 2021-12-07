(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

open P5scm

let parse_for_utop = UTop.parse_default Parse.parse_to_tp
let add_kwds () = List.iter UTop.add_keyword Lexer_utils.extra_kwds

let () =
  add_kwds ();
  Lexer_utils.in_topl := true;
  UTop.require ["compiler-libs.toplevel"];
  UTop.parse_toplevel_phrase := parse_for_utop;
  Toploop.parse_use_file := Parse.parse_to_tp_lst;
  UTop_main.main ()

