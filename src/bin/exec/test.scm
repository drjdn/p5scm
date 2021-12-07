(define lst [1 2 3])
(definerec (sum x)
  (match x
    ([] 0)
    ([hd . tl] (+ hd (sum tl)))))
(print_int (sum lst))
(print_newline)

