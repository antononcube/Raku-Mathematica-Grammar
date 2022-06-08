
use v6;

use Mathematica::Actions::Raku::FullFormLexerRules;

class Mathematica::Actions::English::FullForm
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

    method expr-head($/) {
        make do given $/.values[0] {
            when $_ eq 'Plus' { 'sum' }
            when $_ eq 'List' { 'list' }
            when $_ eq 'Integrate' { 'symbolic integration' }
            default { $/.values[0].made; }
        }
    }

    method expr($/) {
        if $<expressionList> {
            make "{$<expr-head>.made} of {$<expressionList>>>.made.map({ '(' ~ $_ ~ ')' }).join()}.";
        } else {
            make $<expr-head>.made;
        }
    }

    method expressionList($/) {
        make $<expr>>>.made.join(', ');
    }

    method context($/) {
        make $/.Str.subst(:g, '`', '::');
    }

    method symbol($/) {
        make 'symbol ' ~ ( $<context> ?? $<context>.made !! '') ~ $<Name>.made;
    }

    method numberLiteral($/) {
        make ($/.Str.contains('.') ?? 'number ' !! 'integer ') ~ $/.Str;
    }

    method numberLiteralPrecision($/) { make 'number ' ~ $/.Str; }

    ##=======================================================
    ## Special rules / methods
    ##=======================================================

}
