let get_version () =
  let vers = Stdlib.Sys.ocaml_version in
  let vers0 = (String.sub vers 0 5) ^ "X" in
  Printf.printf "%s" vers0; flush stdout

let _ = get_version ()
