# Raku Mathematica::Grammar

This package provides grammar and action classes for parsing and interpretation 
of Mathematica (aka Wolfram Language) expressions.

------

## Grammar derivation

In order to derive the grammars I did the following steps:

1. Take [ANTLR4 grammars](https://github.com/rocky/FoxySheep2/tree/master/grammar)
from Rocky Bernstein's Python package
[FoxySheep2](https://github.com/rocky/FoxySheep2), [RB1].

2. Translate the g4 grammars from ANTLR4's BNF-like format to Raku using Jeff Goff's Raku package
[ANTLR4::Grammar](https://github.com/drforr/perl6-ANTLR4), [JG1].
   
   - See the conversion code in the file
     [Convert-FoxySheep2-ANTLR4-grammars.raku](./examples/Convert-FoxySheep2-ANTLR4-grammars.raku)
     
   - Comment out
     in
     [InputFormLexerRules.g4](https://github.com/rocky/FoxySheep2/blob/master/grammar/InputFormLexerRules.g4)
     :

```g4
options{
  //We put target-language dependent code in a base class.
  superClass=LexerBase;
}
```

3. Minor grammar tweaks:
   
   - Convert some tokens into regexes
     
   - Convert `( ... )` groups into `[ ... ]`  
   
   - Translate applications of ANTLR4 sequence idiom into Raku's standard idiom, e.g. `<expr> % <COMMA>`
    
4. 'Fix' the left recursion of `<expr>` in 
  ["FullForm.rakumod"](./lib/Mathematica/Grammar/FullForm.rakumod).
  
For more details of the origins of the "foxy sheep" projects see Robert Jacobson's project
[FoxySheep](https://github.com/rljacobson/FoxySheep), [RJ1].

------

## TODO

Highest priority items are put on top:

1. [ ] Make the `InputForm` work.

2. [ ] `FullForm` tests:
   
   - [ ] Algebraic expressions
   - [ ] `Dataset` expressions
   - [ ] `VerificationTest`
   - [ ] Function definitions
    
3. [ ] `InputForm` tests:

    - [ ] Algebraic expressions
    - [ ] `Dataset` expressions
    - [ ] `VerificationTest`
    - [ ] Function definitions
   

------

## References

[JG1] Jeff Goff,
[ANTLR4::Grammar Raku package](https://github.com/drforr/perl6-ANTLR4),
(2015),
[GitHub/drforr](https://github.com/drforr).

[RB1] Rocky Bernstein,
[FoxySheep2 Python package](https://github.com/rocky/FoxySheep2),
(2015),
[GitHub/rocky](https://github.com/rocky).

[RJ1] Robert Jacobson,
[FoxySheep Python package](https://github.com/rljacobson/FoxySheep),
(2015),
[GitHub/rljacobson](https://github.com/rljacobson).

[TP1] Terrance Parr, [ANTLR, https://www.antlr.org](https://www.antlr.org).

[TP1] Terrance Parr,
[The Definitive ANTLR 4 Reference](https://pragprog.com/titles/tpantlr2/the-definitive-antlr-4-reference/),
(2013),
Pragmatic Bookshelf,
ISBN:978-1-934356-99-9.