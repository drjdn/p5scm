(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

open P5scm

let tscm = "
(define pass (ref True))

(define (passed bool)
 (match bool
  (True (print_endline \"[Pass]\"))
  (False (print_endline \"[Fail]\"))))

(print_newline)
(print_string \"Simple test: \")
(passed True)
(print_newline)

(define lst [1 2 3])
(definerec (sum x)
  (match x
    ([] 0)
    ([hd . tl] (+ hd (sum tl)))))
(print_string \"Recursive function test: \")
(passed (= (sum lst) 6))
(print_newline)

(define ()
 (let ((a #(0 1 2 3 4 5 6 7 8 9)))
  (begin
   (assert (Array.exists (lambda a (< a 10)) a))
   (assert (Array.exists (lambda a (> a 0)) a))
   (assert (Array.exists (lambda a (= a 0)) a))
   (assert (Array.exists (lambda a (= a 1)) a))
   (assert (Array.exists (lambda a (= a 2)) a))
   (assert (Array.exists (lambda a (= a 3)) a))
   (assert (Array.exists (lambda a (= a 4)) a))
   (assert (Array.exists (lambda a (= a 5)) a))
   (assert (Array.exists (lambda a (= a 6)) a))
   (assert (Array.exists (lambda a (= a 7)) a))
   (assert (Array.exists (lambda a (= a 8)) a))
   (assert (Array.exists (lambda a (= a 9)) a))
   (assert (not (Array.exists (lambda a (< a 0)) a)))
   (assert (not (Array.exists (lambda a (> a 9)) a)))
   (assert (Array.exists (lambda _ True) a)))))

(define ()
 (let ((a #(1 2 3)))
  (begin
   (assert (Array.exists (lambda a (< a 3)) a))
   (assert (Array.exists (lambda a (< a 2)) a))
   (assert (not (Array.exists (lambda a (< a 1)) a)))
   (assert (Array.exists (lambda a (= (mod a 2) 0)) #(1 4 5)))
   (assert (not (Array.exists (lambda a (= (mod a 2) 0)) #(1 3 5))))
   (assert (not (Array.exists (lambda _ True) #())))
   (assert (Array.exists (lambda a (= a.(9) 1)) (Array.make_matrix 10 10 1)))
   (let ((f (Array.create_float 10)))
    (begin
     (Array.fill f 0 10 1.0)
     (assert (Array.exists (lambda a (= a 1.0)) f)))))))

(define ()
 (let (((: a (array int)) #()))
  (begin
   (assert (not (Array.exists (lambda a (= a 0)) a)))
   (assert (not (Array.exists (lambda a (= a 1)) a)))
   (assert (not (Array.exists (lambda a (= a 2)) a)))
   (assert (not (Array.exists (lambda a (= a 3)) a)))
   (assert (not (Array.exists (lambda a (= a 4)) a)))
   (assert (not (Array.exists (lambda a (= a 5)) a)))
   (assert (not (Array.exists (lambda a (= a 6)) a)))
   (assert (not (Array.exists (lambda a (= a 7)) a)))
   (assert (not (Array.exists (lambda a (= a 8)) a)))
   (assert (not (Array.exists (lambda a (= a 9)) a)))
   (assert (not (Array.exists (lambda a (<> a 0)) a)))
   (assert (not (Array.exists (lambda a (<> a 1)) a)))
   (assert (not (Array.exists (lambda a (<> a 2)) a)))
   (assert (not (Array.exists (lambda a (<> a 3)) a)))
   (assert (not (Array.exists (lambda a (<> a 4)) a)))
   (assert (not (Array.exists (lambda a (<> a 5)) a)))
   (assert (not (Array.exists (lambda a (<> a 6)) a)))
   (assert (not (Array.exists (lambda a (<> a 7)) a)))
   (assert (not (Array.exists (lambda a (<> a 8)) a)))
   (assert (not (Array.exists (lambda a (<> a 9)) a)))
   (assert (not (Array.exists (lambda a (< a 0)) a)))
   (assert (not (Array.exists (lambda a (< a 1)) a)))
   (assert (not (Array.exists (lambda a (< a 2)) a)))
   (assert (not (Array.exists (lambda a (< a 3)) a)))
   (assert (not (Array.exists (lambda a (< a 4)) a)))
   (assert (not (Array.exists (lambda a (< a 5)) a)))
   (assert (not (Array.exists (lambda a (< a 6)) a)))
   (assert (not (Array.exists (lambda a (< a 7)) a)))
   (assert (not (Array.exists (lambda a (< a 8)) a)))
   (assert (not (Array.exists (lambda a (< a 9)) a)))
   (assert (not (Array.exists (lambda a (> a 0)) a)))
   (assert (not (Array.exists (lambda a (> a 1)) a)))
   (assert (not (Array.exists (lambda a (> a 2)) a)))
   (assert (not (Array.exists (lambda a (> a 3)) a)))
   (assert (not (Array.exists (lambda a (> a 4)) a)))
   (assert (not (Array.exists (lambda a (> a 5)) a)))
   (assert (not (Array.exists (lambda a (> a 6)) a)))
   (assert (not (Array.exists (lambda a (> a 7)) a)))
   (assert (not (Array.exists (lambda a (> a 8)) a)))
   (assert (not (Array.exists (lambda a (> a 9)) a))))))

(define ()
 (let ((a #(0 1 2 3 4 5 6 7 8 9)))
  (begin
   (assert (Array.for_all (lambda a (< a 10)) a))
   (assert (Array.for_all (lambda a (>= a 0)) a))
   (assert (not (Array.for_all (lambda a (= a 0)) a)))
   (assert (not (Array.for_all (lambda a (= a 1)) a)))
   (assert (not (Array.for_all (lambda a (= a 2)) a)))
   (assert (not (Array.for_all (lambda a (= a 3)) a)))
   (assert (not (Array.for_all (lambda a (= a 4)) a)))
   (assert (not (Array.for_all (lambda a (= a 5)) a)))
   (assert (not (Array.for_all (lambda a (= a 6)) a)))
   (assert (not (Array.for_all (lambda a (= a 7)) a)))
   (assert (not (Array.for_all (lambda a (= a 8)) a)))
   (assert (not (Array.for_all (lambda a (= a 9)) a)))
   (assert (Array.for_all (lambda a (<> a 10)) a))
   (assert (Array.for_all (lambda a (<> a (- 1))) a))
   (assert (Array.for_all (lambda _ True) a)))))

(define ()
 (begin
  (assert (Array.for_all (lambda x (= (mod x 2) 0)) #(2 4 6)))
  (assert (not (Array.for_all (lambda x (= (mod x 2) 0)) #(2 3 6))))
  (assert (Array.for_all (lambda _ False) #()))
  (assert (Array.for_all (lambda a (= a.(9) 1)) (Array.make_matrix 10 10 1)))
  (let ((f (Array.create_float 10)))
   (begin
    (Array.fill f 0 10 1.0)
    (assert (Array.for_all (lambda a (= a 1.0)) f))))))

(define ()
 (let ((a #()))
  (begin
   (assert (Array.for_all (lambda a (< a 10)) a))
   (assert (Array.for_all (lambda a (>= a 0)) a))
   (assert (Array.for_all (lambda a (= a 0)) a))
   (assert (Array.for_all (lambda a (= a 1)) a))
   (assert (Array.for_all (lambda a (= a 2)) a))
   (assert (Array.for_all (lambda a (= a 3)) a))
   (assert (Array.for_all (lambda a (= a 4)) a))
   (assert (Array.for_all (lambda a (= a 5)) a))
   (assert (Array.for_all (lambda a (= a 6)) a))
   (assert (Array.for_all (lambda a (= a 7)) a))
   (assert (Array.for_all (lambda a (= a 8)) a))
   (assert (Array.for_all (lambda a (= a 9)) a))
   (assert (Array.for_all (lambda a (<> a 10)) a))
   (assert (Array.for_all (lambda a (<> a (- 1))) a))
   (assert (Array.for_all (lambda _ True) a)))))

(define (does_raise3 f a b c) (try (begin (ignore (f a b c)) False) (_ True)))

(define ()
 (let ((a #(1 2 3 4 5 6 7 8 9)) (b #(1 2 3 4 5 6 7 8 9)))
  (begin
   (assert (Array.exists2 (lambda (a b) (= a b)) a b))
   (assert (Array.exists2 (lambda (a b) (= (- a b) 0)) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 1) (= b 1))) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 2) (= b 2))) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 3) (= b 3))) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 4) (= b 4))) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 5) (= b 5))) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 6) (= b 6))) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 7) (= b 7))) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 8) (= b 8))) a b))
   (assert (Array.exists2 (lambda (a b) (&& (= a 9) (= b 9))) a b))
   (assert (not (Array.exists2 (lambda (a b) (<> a b)) a b))))))

(define ()
 (let ((a #(1)) (b #(1 2)))
  (begin
   (assert (does_raise3 Array.exists2 (lambda (a b) (= a b)) a b))
   (assert (does_raise3 Array.exists2 (lambda (_ _) True) a b))
   (assert (does_raise3 Array.exists2 (lambda (_ _) False) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 1) (= b 1))) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 2) (= b 2))) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 3) (= b 3))) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 4) (= b 4))) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 5) (= b 5))) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 6) (= b 6))) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 7) (= b 7))) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 8) (= b 8))) a b))
   (assert
    (does_raise3 Array.exists2 (lambda (a b) (&& (= a 9) (= b 9))) a b)))))

(define ()
 (begin
  (assert (Array.exists2 = #(1 2 3) #(3 2 1)))
  (assert (not (Array.exists2 <> #(1 2 3) #(1 2 3))))
  (assert (does_raise3 Array.exists2 = #(1 2) #(3)))
  (let* ((f (Array.create_float 10)) (g (Array.create_float 10)))
   (begin
    (Array.fill f 0 10 1.0)
    (Array.fill g 0 10 1.0)
    (assert (Array.exists2 (lambda (a b) (&& (= a 1.0) (= b 1.0))) f g))))))

(define ()
 (let ((a #(1 2 3 4 5 6 7 8 9)) (b #(1 2 3 4 5 6 7 8 9)))
  (begin
   (assert (Array.for_all2 (lambda (a b) (= a b)) a b))
   (assert (Array.for_all2 (lambda (a b) (= (- a b) 0)) a b))
   (assert (Array.for_all2 (lambda (a b) (&& (> a 0) (> b 0))) a b))
   (assert (Array.for_all2 (lambda (a b) (&& (< a 10) (< b 10))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 1) (= b 1) (<> b 1))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 2) (= b 2) (<> b 2))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 3) (= b 3) (<> b 3))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 4) (= b 4) (<> b 4))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 5) (= b 5) (<> b 5))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 6) (= b 6) (<> b 6))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 7) (= b 7) (<> b 7))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 8) (= b 8) (<> b 8))) a b))
   (assert (Array.for_all2 (lambda (a b) (if (= a 9) (= b 9) (<> b 9))) a b))
   (assert (not (Array.for_all2 (lambda (a b) (<> a b)) a b))))))

(define ()
 (let ((a #(1)) (b #(1 2)))
  (begin
   (assert (does_raise3 Array.for_all2 (lambda (a b) (= a b)) a b))
   (assert (does_raise3 Array.for_all2 (lambda (_ _) True) a b))
   (assert (does_raise3 Array.for_all2 (lambda (_ _) False) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 1) (= b 1))) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 2) (= b 2))) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 3) (= b 3))) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 4) (= b 4))) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 5) (= b 5))) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 6) (= b 6))) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 7) (= b 7))) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 8) (= b 8))) a b))
   (assert
    (does_raise3 Array.for_all2 (lambda (a b) (&& (= a 9) (= b 9))) a b)))))

(define ()
 (begin
  (assert (not (Array.for_all2 = #(1 2 3) #(3 2 1))))
  (assert (Array.for_all2 = #(1 2 3) #(1 2 3)))
  (assert (not (Array.for_all2 <> #(1 2 3) #(3 2 1))))
  (assert (does_raise3 Array.for_all2 = #(1 2 3) #(1 2 3 4)))
  (assert (does_raise3 Array.for_all2 = #(1 2) #()))))

(define ()
 (let ((a #(1 2 3 4 5 6 7 8 9)))
  (begin
   (assert (Array.mem 1 a))
   (assert (Array.mem 2 a))
   (assert (Array.mem 3 a))
   (assert (Array.mem 4 a))
   (assert (Array.mem 5 a))
   (assert (Array.mem 6 a))
   (assert (Array.mem 7 a))
   (assert (Array.mem 8 a))
   (assert (Array.mem 9 a))
   (assert (not (Array.mem 0 a)))
   (assert (not (Array.mem 10 a))))))

(define ()
 (begin
  (assert (Array.mem 2 #(1 2 3)))
  (assert (not (Array.mem 2 #())))
  (assert (Array.mem (ref 3) #((ref 1) (ref 2) (ref 3))))
  (assert (Array.mem #(1 2 3) #(#(1 2 3) #(2 3 4) #(0))))
  (assert (Array.mem 1 (Array.make 100 1)))
  (assert (Array.mem (ref 1) (Array.make 100 (ref 1))))
  (let ((f (Array.create_float 10)))
   (begin (Array.fill f 0 10 1.0) (assert (Array.mem 1.0 f))))))

(define ()
 (let ((a #(1 2 3 4 5 6 7 8 9)))
  (begin
   (assert (Array.memq 1 a))
   (assert (Array.memq 2 a))
   (assert (Array.memq 3 a))
   (assert (Array.memq 4 a))
   (assert (Array.memq 5 a))
   (assert (Array.memq 6 a))
   (assert (Array.memq 7 a))
   (assert (Array.memq 8 a))
   (assert (Array.memq 9 a))
   (assert (not (Array.memq 0 a)))
   (assert (not (Array.memq 10 a))))))

(define ()
 (begin
  (assert (Array.memq 2 #(1 2 3)))
  (assert (not (Array.memq 2 #())))
  (assert (not (Array.memq (ref 3) #((ref 1) (ref 2) (ref 3)))))
  (assert (not (Array.memq #(1 2 3) #(#(1 2 3) #(2 3 4) #(0)))))
  (assert (Array.memq 1 (Array.make 100 1)))
  (assert (not (Array.memq (ref 1) (Array.make 100 (ref 1)))))
  (let ((f (Array.create_float 10))) (Array.fill f 0 10 1.0))))

(print_string \"Array tests: \")
(passed True)
(print_newline)

(print_string \"Structure test: \")
(type pt {(x int) (y int)})
(define xy {(x 1) (y 2)})
(:= pass.val (== xy.x 1))
(passed pass.val)
(print_newline)

(print_string \"List test: \")
(define lst [1 2 3])
(:= pass.val (== (List.fold_left + 0 lst) 6))
(passed pass.val)
(print_newline)

(print_string \"Vector test: \")
(define vec #(1 2 3))
(:= pass.val (== (Array.fold_left + 0 vec) 6))
(passed pass.val)
(print_newline)
"

let pwd = Sys.getcwd ();;

let ast = Parse.parse_from_string tscm in
let p5str = Pp_ast.ast_to_p5scm ast in
Trans.scm_to_bin_file p5str "test.ml";;

let _ = Sys.command("ocamlopt test.ml -o run");;
let _ = Sys.command("./run");;

