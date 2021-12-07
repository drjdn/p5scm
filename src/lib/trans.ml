(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

let add_nl str = str ^ "\n"

let scm_to_mlast str =
  let mlast, _ = Pa_scheme.pa_sch str in
  List.map fst mlast

let scm_to_tp str = Ast2pt.phrase (List.hd (scm_to_mlast str))
let scm_to_tp_lst str = List.map Ast2pt.phrase (scm_to_mlast str)
let scm_to_struct str = Ast2pt.implem "-" (scm_to_mlast str)

let scm_to_ml str =
  let mlast, _ = Pa_scheme.pa_sch str in
  let strml = List.map Pr_o.pr_o (List.map fst mlast) in
  let out = String.concat "" (List.map add_nl strml) in
  out ^ ";;\n"

let scm_to_struct_to_ml str =
  let stast = scm_to_struct str in
  let out = Pprintast.string_of_structure stast in
  out ^ ";;\n"

let scm_to_bin str =
  let mlast, status = Pa_scheme.pa_sch str in
  let phr =
    match status with
    | None -> failwith "No location provied!"
    | Some loc -> mlast, loc
  in
  Pr_dump.pr_dump phr

let scm_to_bin_file str fname =
  let mlast, status = Pa_scheme.pa_sch str in
  let phr =
    match status with
    | None -> failwith "No location provied!"
    | Some loc -> mlast, loc
  in
  Pcaml.output_file := Some fname;
  Pr_dump.pr_dump phr
