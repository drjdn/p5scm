val ppos : Lexing.lexbuf -> unit
val pspos : Lexing.lexbuf -> string
val lexeme : Lexing.lexbuf -> string
val new_line : Lexing.lexbuf -> unit
val dp_str : string -> string
val p5_bool : string -> string
val extra_kwds : string list
val map_ident : string -> Tokens.token
val in_topl : bool ref
val check_topl : Lexing.lexbuf -> unit