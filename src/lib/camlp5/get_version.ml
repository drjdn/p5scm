let get_version () =
  let vers = Stdlib.Sys.ocaml_version in
  if (String.length vers) > 5 then
    let vers0 = (String.sub vers 0 5) ^ "X" in
    Printf.printf "%s\n" vers0; flush stdout
  else
    let vers0 = (String.sub vers 0 4) ^ "X" in
    Printf.printf "%s\n" vers0; flush stdout
    
let _ = get_version ()
