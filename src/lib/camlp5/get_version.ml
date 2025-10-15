let get_version () =
  let vers = Stdlib.Sys.ocaml_version in
  let indx = String.index_from vers 2 '.' in 
  let vers0 = (String.sub vers 0 (indx+1)) ^ "X" in
  Printf.printf "%s\n" vers0; flush stdout
    
let _ = get_version ()
