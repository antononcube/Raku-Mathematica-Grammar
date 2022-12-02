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

    method expr-head($/) {
        make $/.values[0].made;
    }

    method expr($/) {
        if $<expressionList> {
            my $head = $<expr-head>.made;
            given $head {
                when 'Association' {
                    $head = 'Hash';
                    make $head ~ $<expressionList>>>.made.map({ '(' ~ $_ ~ ')' }).join();
                }
                when 'Rule' {
                    $head = 'Pair.new';
                    make $head ~ $<expressionList>>>.made.map({ '(' ~ $_ ~ ')' }).join();
                }
                when $_ ∈ <Plus Times> {
                    my %h2h = Plus => '&[+]', Times => '&[*]';
                    make 'reduce(' ~ %h2h{$_}  ~ ', ' ~ $<expressionList>>>.made.map({ '(' ~ $_ ~ ')' }).join() ~ ')';
                }
                default {
                    make $head ~ $<expressionList>>>.made.map({ '(' ~ $_ ~ ')' }).join();
                }
            }
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
        make ($<context> ?? $<context>.made !! '') ~ $<Name>.made;
    }

    method numberLiteral($/) {
        my $res;
        if $<DecimalNumber> {
            $res = $<DecimalNumber>.Str;
            if $res ~~ / .* '.' $ / {
                $res ~= '0';
            }
        } elsif $<DIGITS> {
            $res = $<DIGITS>.Str;
        }
        with $<numberLiteralPrecision> {
            if $<numberLiteralPrecision>.made {
                note "Arbitrary precision conversion is not implemented yet. Continue with Num. (Specified precision is { $<numberLiteralPrecision>.made }.)";
            }
        }
        make $res;
    }

    method numberLiteralPrecision($/) {
        if $<DecimalNumber> {
            make $<DecimalNumber>.made;
        } else {
            make '';
        }
    }

    ##=======================================================
    ## Special rules / methods
    ##=======================================================

}
