(*
 The MIT License                                                                              

 Copyright (c) 2021 Jason D. Nielsen <drjdnielsen@gmail.com>
 *)

%{
   open Ast
%}


%token <string> BOOL IDENT TIDENT KEYWORD INT FLOAT OP CHAR STRING TOPL
%token LPR RPR LSQ RSQ VLPR LCL RCL DOT EOF

%start prog
%type <Ast.sexpr> prog


%%
   
prog:
    | list(sexpr) EOF  { Plist($1) }
    | TOPL STRING EOF  { Plist([Toplv($1, $2)]) }
    ;

sexpr:
     | slist  { $1 }
     | vlist  { $1 }
     | stlist { $1 }
     | alist  { $1 }
     | patt   { $1 }
     | atom   { $1 }
     ;

patt:
    | LSQ sexpr DOT sexpr RSQ  { Lpatt($2, $4) }
    ;

slist:
     | LPR list(sexpr) RPR  { Slist($2) }
     ;

stlist:
      | LCL list(sexpr) RCL  { Stlist($2) }
      ;

alist:
     | LSQ list(sexpr) RSQ  { Alist($2) }
     ;

vlist:
     | VLPR list(sexpr) RPR  { Vlist($2) }
     ;

atom:
    | BOOL     { Atom(Bool,$1) }
    | IDENT    { Atom(Ident,$1) }
    | TIDENT   { Atom(Tident,$1) }
    | KEYWORD  { Atom(Keyword,$1) }
    | INT      { Atom(Int,$1) }
    | FLOAT    { Atom(Float,$1) }
    | OP       { Atom(Op,$1) }
    | CHAR     { Atom(Char,$1) }
    | STRING   { Atom(String,$1) }
    ;
