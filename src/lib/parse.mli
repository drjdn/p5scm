val parse_from_chan : in_channel -> Ast.sexpr
val parse_from_string : string -> Ast.sexpr
val parse_to_tp : Lexing.lexbuf -> Parsetree.toplevel_phrase
val parse_to_tp_lst : Lexing.lexbuf -> Parsetree.toplevel_phrase list
val parse_to_bin : in_channel -> unit
val parse_to_file : in_channel -> unit
