(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

open P5scm

let main () =
  let cin =
    if Array.length Sys.argv = 2 then 
      open_in Sys.argv.(1)
    else 
       failwith "A file to parse needs to be specified!"
  in
  Parse.parse_to_bin cin

let _ = main ()
