
use v6;

use Mathematica::Actions::Raku::FullFormLexerRules;

class Mathematica::Actions::Raku::FullForm
        is Mathematica::Actions::Raku::FullFormLexerRules {

    ##=======================================================
    ## General rules / methods
    ##=======================================================

    method TOP($/) {
        make $/.values[0].made;
    }

    method full-form-program($/) {
        make $/.values>>.made.join("\n");
    }

    method expr-head($/) { make $/.values[0].made; }

    method expr($/) {
        if $<expressionList> {
            make $<expr-head>.made ~ $<expressionList>>>.made.map({ '(' ~ $_ ~ ')' }).join();
        } else {
            make $<expr-head>.made;
        }
    }

    method expressionList($/) {
        make $<expr>>>.made.join(',');
    }

    method context($/) {
        make $/.Str.subst(:g, '`', '::');
    }

    method symbol($/) {
        make ( $<context> ?? $<context>.made !! '') ~ $<Name>.made;
    }

    method numberLiteral($/) { make $/.Str; }

    method numberLiteralPrecision($/) { make $/.Str.Numeric; }

    ##=======================================================
    ## Special rules / methods
    ##=======================================================

}
