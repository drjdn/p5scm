val scm_to_mlast : string -> MLast.str_item list
val scm_to_tp : string -> Parsetree.toplevel_phrase
val scm_to_tp_lst : string -> Parsetree.toplevel_phrase list
val scm_to_struct : string -> Parsetree.structure
val scm_to_ml : string -> string
val scm_to_struct_to_ml : string -> string
val scm_to_bin : string -> unit
val scm_to_bin_file : string -> string -> unit
